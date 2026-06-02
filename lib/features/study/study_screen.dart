import 'dart:async';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/node.dart';
import '../../data/models/study_session.dart';
import '../../data/repositories/node_repository.dart';
import '../../data/repositories/study_repository.dart';

class StudyScreen extends ConsumerStatefulWidget {
  const StudyScreen({super.key});

  @override
  ConsumerState<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends ConsumerState<StudyScreen> {
  Timer? _ticker;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeSessionAsync = ref.watch(activeStudySessionProvider);
    final activeNodesAsync = ref.watch(nodeListProvider);
    final completedNodesAsync = ref.watch(completedNodeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Athena'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estrutura de Estudos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            activeSessionAsync.when(
              data: (activeSession) {
                if (activeSession == null) {
                  return _buildNoActiveSessionCard();
                }
                return _buildActiveSessionCard(activeSession);
              },
              loading: () => const SizedBox(height: 120, child: Center(child: CircularProgressIndicator())),
              error: (error, stack) => Text('Erro ao carregar sessão ativa: $error'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: activeNodesAsync.when(
                data: (nodes) {
                  if (nodes.isEmpty) {
                    return const Center(child: Text('Nenhum nó encontrado.'));
                  }

                  final rows = _buildTreeRows(context, ref, nodes);
                  return ListView.separated(
                    itemCount: rows.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => rows[index],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Erro ao carregar nós: $error')),
              ),
            ),
            const SizedBox(height: 16),
            completedNodesAsync.when(
              data: (completed) {
                if (completed.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Card(
                  elevation: 2,
                  child: ExpansionTile(
                    title: const Text('Nós concluídos'),
                    children: completed
                        .map(
                          (node) => ListTile(
                            title: Text(node.name),
                            subtitle: Text(node.description ?? 'Sem descrição'),
                            trailing: const Icon(Icons.check_circle, color: Colors.green),
                            onTap: () => _showNodeActions(context, ref, node),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (error, stack) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Criar novo nó'),
                onPressed: () {
                  _showCreateNodeDialog(context, ref);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveSessionCard(StudySessionEntry session) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: const Text('Sessão ativa'),
        subtitle: Text('Nó ${session.nodeId}\nTempo: ${session.formattedElapsed(_now)}'),
        trailing: FilledButton(
          onPressed: () async {
            await ref.read(studyRepositoryProvider).stopActiveSession();
            ref.invalidate(activeStudySessionProvider);
            ref.invalidate(nodeListProvider);
          },
          child: const Text('Parar'),
        ),
      ),
    );
  }

  Widget _buildNoActiveSessionCard() {
    return const Card(
      elevation: 2,
      child: ListTile(
        title: Text('Nenhuma sessão ativa'),
        subtitle: Text('Pressione e segure um nó para iniciar uma sessão de estudo.'),
      ),
    );
  }

  List<Widget> _buildTreeRows(BuildContext context, WidgetRef ref, List<StudyNode> nodes) {
    final rootNodes = nodes.where((node) => node.parentId == null).toList();

    final rows = <Widget>[];
    for (final root in rootNodes) {
      rows.add(_IndentedNodeTile(
        node: root,
        depth: 0,
        onLongPress: () => _showNodeActions(context, ref, root),
      ));
      rows.addAll(_buildChildRows(context, ref, root, nodes, depth: 1));
    }

    return rows;
  }

  List<Widget> _buildChildRows(BuildContext context, WidgetRef ref, StudyNode parent, List<StudyNode> nodes, {required int depth}) {
    final children = nodes.where((node) => node.parentId == parent.id).toList();
    if (children.isEmpty) {
      return [];
    }

    final rows = <Widget>[];
    for (final child in children) {
      rows.add(_IndentedNodeTile(
        node: child,
        depth: depth,
        onLongPress: () => _showNodeActions(context, ref, child),
      ));
      rows.addAll(_buildChildRows(context, ref, child, nodes, depth: depth + 1));
    }
    return rows;
  }

  Future<void> _showNodeActions(BuildContext context, WidgetRef ref, StudyNode node) async {
    final rootContext = context;
    final activeSession = await ref.read(studyRepositoryProvider).getActiveSession();
    if (!rootContext.mounted) return;

    await showDialog<void>(
      context: rootContext,
      builder: (dialogContext) {
        return SimpleDialog(
          title: Text(node.name),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _showEditNodeDialog(context, ref, node);
              },
              child: const Text('Editar'),
            ),
            if (!node.isCompleted && activeSession == null)
              SimpleDialogOption(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await _startSessionForNode(context, ref, node);
                },
                child: const Text('Iniciar sessão'),
              ),
            if (activeSession != null && activeSession.nodeId == node.id)
              SimpleDialogOption(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await ref.read(studyRepositoryProvider).stopActiveSession();
                  ref.invalidate(activeStudySessionProvider);
                  ref.invalidate(nodeListProvider);
                },
                child: const Text('Parar sessão'),
              ),
            if (activeSession != null && activeSession.nodeId != node.id)
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  if (!rootContext.mounted) return;
                  ScaffoldMessenger.of(rootContext).showSnackBar(
                    const SnackBar(content: Text('Já existe uma sessão ativa em outro nó.')),
                  );
                },
                child: const Text('Sessão ativa em outro nó'),
              ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _startSessionForNode(BuildContext context, WidgetRef ref, StudyNode node) async {
    try {
      await ref.read(studyRepositoryProvider).startSession(nodeId: node.id);
      ref.invalidate(activeStudySessionProvider);
      ref.invalidate(nodeListProvider);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sessão iniciada.')),
      );
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Não foi possível iniciar a sessão: $error')),
      );
    }
  }

  void _showCreateNodeDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    int? selectedParentId;
    final nodesAsync = ref.read(nodeListProvider);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setState) {
            return AlertDialog(
              title: const Text('Criar novo nó'),
              content: nodesAsync.when(
                data: (nodes) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descrição (opcional)',
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<int?>(
                          initialValue: selectedParentId,
                          decoration: const InputDecoration(
                            labelText: 'Pai (opcional)',
                          ),
                          items: [
                            const DropdownMenuItem<int?>(
                              value: null,
                              child: Text('Raiz'),
                            ),
                            ...nodes.map(
                              (node) => DropdownMenuItem<int?>(
                                value: node.id,
                                child: Text(node.name),
                              ),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedParentId = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
                error: (error, stack) => Text('Falha ao carregar nós: $error'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final description = descriptionController.text.trim();

                    if (name.isEmpty) {
                      return;
                    }

                    await ref.read(nodeRepositoryProvider).addNode(
                          name: name,
                          description: description.isEmpty ? null : description,
                          parentId: selectedParentId,
                        );

                    ref.invalidate(nodeListProvider);
                    ref.invalidate(completedNodeListProvider);
                    if (dialogContext.mounted) {
                      Navigator.of(dialogContext).pop();
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditNodeDialog(BuildContext context, WidgetRef ref, StudyNode node) {
    final nameController = TextEditingController(text: node.name);
    final descriptionController = TextEditingController(text: node.description);
    int? selectedParentId = node.parentId;
    final nodesAsync = ref.read(nodeListProvider);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setState) {
            return AlertDialog(
              title: const Text('Editar nó'),
              content: nodesAsync.when(
                data: (nodes) {
                  final parentOptions = nodes.where((candidate) => candidate.id != node.id).toList();
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descrição (opcional)',
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<int?>(
                          initialValue: selectedParentId,
                          decoration: const InputDecoration(
                            labelText: 'Pai (opcional)',
                          ),
                          items: [
                            const DropdownMenuItem<int?>(
                              value: null,
                              child: Text('Raiz'),
                            ),
                            ...parentOptions.map(
                              (candidate) => DropdownMenuItem<int?>(
                                value: candidate.id,
                                child: Text(candidate.name),
                              ),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedParentId = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
                error: (error, stack) => Text('Falha ao carregar nós: $error'),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final description = descriptionController.text.trim();

                    if (name.isEmpty) {
                      return;
                    }

                    await ref.read(nodeRepositoryProvider).updateNode(
                          node.id,
                          name: name,
                          description: description.isEmpty ? null : description,
                          parentId: Value(selectedParentId),
                        );

                    ref.invalidate(nodeListProvider);
                    ref.invalidate(completedNodeListProvider);
                    if (dialogContext.mounted) {
                      Navigator.of(dialogContext).pop();
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _IndentedNodeTile extends StatelessWidget {
  final StudyNode node;
  final int depth;
  final VoidCallback onLongPress;

  const _IndentedNodeTile({Key? key, required this.node, required this.depth, required this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 16.0),
      child: Card(
        child: ListTile(
          title: Text(node.name),
          subtitle: Text(node.description ?? 'Sem descrição'),
          trailing: node.isCompleted ? const Icon(Icons.check_circle, color: Colors.green) : null,
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
