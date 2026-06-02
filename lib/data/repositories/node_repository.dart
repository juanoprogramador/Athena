import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/node.dart';

final nodeRepositoryProvider = Provider<NodeRepository>((ref) {
  return NodeRepository();
});

final nodeListProvider = Provider<List<Node>>((ref) {
  return ref.watch(nodeRepositoryProvider).getRootNodes();
});

class NodeRepository {
  final List<Node> _nodes = [
    Node(
      id: 1,
      parentId: null,
      name: 'Vestibular',
      description: 'Estrutura inicial de estudos',
      status: 'active',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Node(
      id: 2,
      parentId: 1,
      name: 'Matemática',
      description: 'Matemática geral e revisão',
      status: 'active',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  List<Node> getRootNodes() => _nodes.where((node) => node.parentId == null).toList();

  void add(Node node) {
    _nodes.add(node);
  }
}
