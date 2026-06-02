// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NodesTable extends Nodes with TableInfo<$NodesTable, Node> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _archivedAtMeta =
      const VerificationMeta('archivedAt');
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
      'archived_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        name,
        description,
        status,
        dueDate,
        createdAt,
        updatedAt,
        completedAt,
        archivedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nodes';
  @override
  VerificationContext validateIntegrity(Insertable<Node> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('archived_at')) {
      context.handle(
          _archivedAtMeta,
          archivedAt.isAcceptableOrUnknown(
              data['archived_at']!, _archivedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Node map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Node(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      archivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}archived_at']),
    );
  }

  @override
  $NodesTable createAlias(String alias) {
    return $NodesTable(attachedDatabase, alias);
  }
}

class Node extends DataClass implements Insertable<Node> {
  final int id;
  final int? parentId;
  final String name;
  final String? description;
  final String status;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final DateTime? archivedAt;
  const Node(
      {required this.id,
      this.parentId,
      required this.name,
      this.description,
      required this.status,
      this.dueDate,
      required this.createdAt,
      required this.updatedAt,
      this.completedAt,
      this.archivedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  NodesCompanion toCompanion(bool nullToAbsent) {
    return NodesCompanion(
      id: Value(id),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
    );
  }

  factory Node.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Node(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int?>(parentId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  Node copyWith(
          {int? id,
          Value<int?> parentId = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          String? status,
          Value<DateTime?> dueDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> completedAt = const Value.absent(),
          Value<DateTime?> archivedAt = const Value.absent()}) =>
      Node(
        id: id ?? this.id,
        parentId: parentId.present ? parentId.value : this.parentId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
      );
  Node copyWithCompanion(NodesCompanion data) {
    return Node(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      archivedAt:
          data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Node(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId, name, description, status,
      dueDate, createdAt, updatedAt, completedAt, archivedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Node &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.name == this.name &&
          other.description == this.description &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.completedAt == this.completedAt &&
          other.archivedAt == this.archivedAt);
}

class NodesCompanion extends UpdateCompanion<Node> {
  final Value<int> id;
  final Value<int?> parentId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> archivedAt;
  const NodesCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  });
  NodesCompanion.insert({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Node> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? archivedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
    });
  }

  NodesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? parentId,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? status,
      Value<DateTime?>? dueDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? completedAt,
      Value<DateTime?>? archivedAt}) {
    return NodesCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      archivedAt: archivedAt ?? this.archivedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NodesCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTable extends StudySessions
    with TableInfo<$StudySessionsTable, StudySession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<int> nodeId = GeneratedColumn<int>(
      'node_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES nodes(id)');
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, nodeId, startedAt, endedAt, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<StudySession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    } else if (isInserting) {
      context.missing(_nodeIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}node_id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ended_at']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $StudySessionsTable createAlias(String alias) {
    return $StudySessionsTable(attachedDatabase, alias);
  }
}

class StudySession extends DataClass implements Insertable<StudySession> {
  final int id;
  final int nodeId;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? notes;
  final DateTime createdAt;
  const StudySession(
      {required this.id,
      required this.nodeId,
      required this.startedAt,
      this.endedAt,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['node_id'] = Variable<int>(nodeId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StudySessionsCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsCompanion(
      id: Value(id),
      nodeId: Value(nodeId),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory StudySession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySession(
      id: serializer.fromJson<int>(json['id']),
      nodeId: serializer.fromJson<int>(json['nodeId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nodeId': serializer.toJson<int>(nodeId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StudySession copyWith(
          {int? id,
          int? nodeId,
          DateTime? startedAt,
          Value<DateTime?> endedAt = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      StudySession(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        startedAt: startedAt ?? this.startedAt,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  StudySession copyWithCompanion(StudySessionsCompanion data) {
    return StudySession(
      id: data.id.present ? data.id.value : this.id,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySession(')
          ..write('id: $id, ')
          ..write('nodeId: $nodeId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nodeId, startedAt, endedAt, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySession &&
          other.id == this.id &&
          other.nodeId == this.nodeId &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class StudySessionsCompanion extends UpdateCompanion<StudySession> {
  final Value<int> id;
  final Value<int> nodeId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const StudySessionsCompanion({
    this.id = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StudySessionsCompanion.insert({
    this.id = const Value.absent(),
    required int nodeId,
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : nodeId = Value(nodeId);
  static Insertable<StudySession> custom({
    Expression<int>? id,
    Expression<int>? nodeId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StudySessionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? nodeId,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endedAt,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return StudySessionsCompanion(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<int>(nodeId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsCompanion(')
          ..write('id: $id, ')
          ..write('nodeId: $nodeId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NodesTable nodes = $NodesTable(this);
  late final $StudySessionsTable studySessions = $StudySessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nodes, studySessions];
}

typedef $$NodesTableCreateCompanionBuilder = NodesCompanion Function({
  Value<int> id,
  Value<int?> parentId,
  required String name,
  Value<String?> description,
  Value<String> status,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> archivedAt,
});
typedef $$NodesTableUpdateCompanionBuilder = NodesCompanion Function({
  Value<int> id,
  Value<int?> parentId,
  Value<String> name,
  Value<String?> description,
  Value<String> status,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> archivedAt,
});

final class $$NodesTableReferences
    extends BaseReferences<_$AppDatabase, $NodesTable, Node> {
  $$NodesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudySessionsTable, List<StudySession>>
      _studySessionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.studySessions,
              aliasName:
                  $_aliasNameGenerator(db.nodes.id, db.studySessions.nodeId));

  $$StudySessionsTableProcessedTableManager get studySessionsRefs {
    final manager = $$StudySessionsTableTableManager($_db, $_db.studySessions)
        .filter((f) => f.nodeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studySessionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NodesTableFilterComposer extends Composer<_$AppDatabase, $NodesTable> {
  $$NodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
      column: $table.archivedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> studySessionsRefs(
      Expression<bool> Function($$StudySessionsTableFilterComposer f) f) {
    final $$StudySessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.studySessions,
        getReferencedColumn: (t) => t.nodeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudySessionsTableFilterComposer(
              $db: $db,
              $table: $db.studySessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NodesTableOrderingComposer
    extends Composer<_$AppDatabase, $NodesTable> {
  $$NodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
      column: $table.archivedAt, builder: (column) => ColumnOrderings(column));
}

class $$NodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NodesTable> {
  $$NodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
      column: $table.archivedAt, builder: (column) => column);

  Expression<T> studySessionsRefs<T extends Object>(
      Expression<T> Function($$StudySessionsTableAnnotationComposer a) f) {
    final $$StudySessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.studySessions,
        getReferencedColumn: (t) => t.nodeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudySessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.studySessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NodesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NodesTable,
    Node,
    $$NodesTableFilterComposer,
    $$NodesTableOrderingComposer,
    $$NodesTableAnnotationComposer,
    $$NodesTableCreateCompanionBuilder,
    $$NodesTableUpdateCompanionBuilder,
    (Node, $$NodesTableReferences),
    Node,
    PrefetchHooks Function({bool studySessionsRefs})> {
  $$NodesTableTableManager(_$AppDatabase db, $NodesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> archivedAt = const Value.absent(),
          }) =>
              NodesCompanion(
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
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> archivedAt = const Value.absent(),
          }) =>
              NodesCompanion.insert(
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
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$NodesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({studySessionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (studySessionsRefs) db.studySessions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (studySessionsRefs)
                    await $_getPrefetchedData<Node, $NodesTable, StudySession>(
                        currentTable: table,
                        referencedTable:
                            $$NodesTableReferences._studySessionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NodesTableReferences(db, table, p0)
                                .studySessionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.nodeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NodesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NodesTable,
    Node,
    $$NodesTableFilterComposer,
    $$NodesTableOrderingComposer,
    $$NodesTableAnnotationComposer,
    $$NodesTableCreateCompanionBuilder,
    $$NodesTableUpdateCompanionBuilder,
    (Node, $$NodesTableReferences),
    Node,
    PrefetchHooks Function({bool studySessionsRefs})>;
typedef $$StudySessionsTableCreateCompanionBuilder = StudySessionsCompanion
    Function({
  Value<int> id,
  required int nodeId,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $$StudySessionsTableUpdateCompanionBuilder = StudySessionsCompanion
    Function({
  Value<int> id,
  Value<int> nodeId,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

final class $$StudySessionsTableReferences
    extends BaseReferences<_$AppDatabase, $StudySessionsTable, StudySession> {
  $$StudySessionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $NodesTable _nodeIdTable(_$AppDatabase db) => db.nodes
      .createAlias($_aliasNameGenerator(db.studySessions.nodeId, db.nodes.id));

  $$NodesTableProcessedTableManager get nodeId {
    final $_column = $_itemColumn<int>('node_id')!;

    final manager = $$NodesTableTableManager($_db, $_db.nodes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nodeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StudySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$NodesTableFilterComposer get nodeId {
    final $$NodesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nodeId,
        referencedTable: $db.nodes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NodesTableFilterComposer(
              $db: $db,
              $table: $db.nodes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StudySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$NodesTableOrderingComposer get nodeId {
    final $$NodesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nodeId,
        referencedTable: $db.nodes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NodesTableOrderingComposer(
              $db: $db,
              $table: $db.nodes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StudySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$NodesTableAnnotationComposer get nodeId {
    final $$NodesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nodeId,
        referencedTable: $db.nodes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NodesTableAnnotationComposer(
              $db: $db,
              $table: $db.nodes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StudySessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudySessionsTable,
    StudySession,
    $$StudySessionsTableFilterComposer,
    $$StudySessionsTableOrderingComposer,
    $$StudySessionsTableAnnotationComposer,
    $$StudySessionsTableCreateCompanionBuilder,
    $$StudySessionsTableUpdateCompanionBuilder,
    (StudySession, $$StudySessionsTableReferences),
    StudySession,
    PrefetchHooks Function({bool nodeId})> {
  $$StudySessionsTableTableManager(_$AppDatabase db, $StudySessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> nodeId = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              StudySessionsCompanion(
            id: id,
            nodeId: nodeId,
            startedAt: startedAt,
            endedAt: endedAt,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int nodeId,
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              StudySessionsCompanion.insert(
            id: id,
            nodeId: nodeId,
            startedAt: startedAt,
            endedAt: endedAt,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StudySessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({nodeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (nodeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.nodeId,
                    referencedTable:
                        $$StudySessionsTableReferences._nodeIdTable(db),
                    referencedColumn:
                        $$StudySessionsTableReferences._nodeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StudySessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudySessionsTable,
    StudySession,
    $$StudySessionsTableFilterComposer,
    $$StudySessionsTableOrderingComposer,
    $$StudySessionsTableAnnotationComposer,
    $$StudySessionsTableCreateCompanionBuilder,
    $$StudySessionsTableUpdateCompanionBuilder,
    (StudySession, $$StudySessionsTableReferences),
    StudySession,
    PrefetchHooks Function({bool nodeId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NodesTableTableManager get nodes =>
      $$NodesTableTableManager(_db, _db.nodes);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db, _db.studySessions);
}
