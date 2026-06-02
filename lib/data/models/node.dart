import '../database/app_database.dart';

class StudyNode {
  final int id;
  final int? parentId;
  final String name;
  final String? description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? dueDate;
  final DateTime? completedAt;
  final DateTime? archivedAt;

  StudyNode({
    required this.id,
    this.parentId,
    required this.name,
    this.description,
    this.status = NodeStatus.active,
    required this.createdAt,
    required this.updatedAt,
    this.dueDate,
    this.completedAt,
    this.archivedAt,
  });

  StudyNode copyWith({
    int? id,
    int? parentId,
    String? name,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? dueDate,
    DateTime? completedAt,
    DateTime? archivedAt,
  }) {
    return StudyNode(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      dueDate: dueDate ?? this.dueDate,
      completedAt: completedAt ?? this.completedAt,
      archivedAt: archivedAt ?? this.archivedAt,
    );
  }

  bool get isActive => status == NodeStatus.active;
  bool get isCompleted => status == NodeStatus.completed;
  bool get isArchived => status == NodeStatus.archived;
}

extension NodeDataMapper on Node {
  StudyNode toNode() {
    return StudyNode(
      id: id,
      parentId: parentId,
      name: name,
      description: description,
      status: status,
      dueDate: dueDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      completedAt: completedAt,
      archivedAt: archivedAt,
    );
  }

  bool get isActive => status == NodeStatus.active;
  bool get isCompleted => status == NodeStatus.completed;
  bool get isArchived => status == NodeStatus.archived;
}

class NodeStatus {
  static const active = 'active';
  static const completed = 'completed';
  static const archived = 'archived';
}
