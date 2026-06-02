import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart' as db;
import '../models/node.dart';

final databaseProvider = Provider<db.AppDatabase>((ref) {
  return db.AppDatabase();
});

final nodeRepositoryProvider = Provider<NodeRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return NodeRepository(database);
});

final nodeListProvider = FutureProvider<List<StudyNode>>((ref) {
  return ref.watch(nodeRepositoryProvider).getActiveNodes();
});

final completedNodeListProvider = FutureProvider<List<StudyNode>>((ref) {
  return ref.watch(nodeRepositoryProvider).getCompletedNodes();
});

class NodeRepository {
  final db.AppDatabase _database;

  NodeRepository(this._database);

  Future<List<StudyNode>> getNodes({List<String>? statuses}) async {
    final query = _database.select(_database.nodes);
    if (statuses != null && statuses.isNotEmpty) {
      query.where((tbl) => tbl.status.isIn(statuses));
    }
    final rows = await query.get();
    return rows.map((row) => row.toNode()).toList();
  }

  Future<List<StudyNode>> getAllNodes() async {
    return getNodes();
  }

  Future<List<StudyNode>> getActiveNodes() async {
    return getNodes(statuses: [NodeStatus.active]);
  }

  Future<List<StudyNode>> getCompletedNodes() async {
    return getNodes(statuses: [NodeStatus.completed]);
  }

  Future<List<StudyNode>> getRootNodes({List<String>? statuses}) async {
    final query = _database.select(_database.nodes)
      ..where((tbl) => tbl.parentId.isNull());

    if (statuses != null && statuses.isNotEmpty) {
      query.where((tbl) => tbl.status.isIn(statuses));
    }

    final rows = await query.get();
    return rows.map((row) => row.toNode()).toList();
  }

  Future<int> addNode({
    required String name,
    String? description,
    int? parentId,
  }) async {
    final companion = db.NodesCompanion(
      parentId: Value(parentId),
      name: Value(name),
      description: Value(description),
      status: const Value(NodeStatus.active),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );

    return _database.into(_database.nodes).insert(companion);
  }

  Future<int> updateNode(
    int id, {
    String? name,
    String? description,
    Value<int?> parentId = const Value.absent(),
    String? status,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<DateTime?> archivedAt = const Value.absent(),
  }) async {
    final companion = db.NodesCompanion(
      name: name == null ? const Value.absent() : Value(name),
      description: description == null ? const Value.absent() : Value(description),
      parentId: parentId,
      status: status == null ? const Value.absent() : Value(status),
      completedAt: completedAt,
      archivedAt: archivedAt,
      updatedAt: Value(DateTime.now()),
    );

    return (_database.update(_database.nodes)..where((tbl) => tbl.id.equals(id))).write(companion);
  }

  Future<int> completeNode(int id, bool complete) async {
    return updateNode(
      id,
      status: complete ? NodeStatus.completed : NodeStatus.active,
      completedAt: complete ? Value(DateTime.now()) : const Value(null),
      archivedAt: const Value.absent(),
    );
  }

  Future<int> archiveNode(int id) async {
    return updateNode(
      id,
      status: NodeStatus.archived,
      archivedAt: Value(DateTime.now()),
    );
  }

  Future<int> restoreNode(int id) async {
    return updateNode(
      id,
      status: NodeStatus.active,
      completedAt: const Value.absent(),
      archivedAt: const Value.absent(),
    );
  }
}
