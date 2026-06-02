import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/node.dart';
import '../../data/repositories/node_repository.dart';

class StudyScreen extends ConsumerWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeListProvider);

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
            Expanded(
              child: nodes.isEmpty
                  ? const Center(child: Text('Nenhum nó encontrado.'))
                  : ListView.separated(
                      itemCount: nodes.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => NodeTile(node: nodes[index]),
                    ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Criar novo nó'),
                onPressed: () {
                  // TODO: implementar criação de nó
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NodeTile extends StatelessWidget {
  final Node node;

  const NodeTile({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(node.name),
        subtitle: Text(node.description ?? 'Sem descrição'),
        trailing: Text(node.status),
      ),
    );
  }
}
