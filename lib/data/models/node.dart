class Node {
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

  Node({
    required this.id,
    this.parentId,
    required this.name,
    this.description,
    this.status = 'active',
    required this.createdAt,
    required this.updatedAt,
    this.dueDate,
    this.completedAt,
    this.archivedAt,
  });

  Node copyWith({
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
    return Node(
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
}
