import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Nodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().nullable()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get archivedAt => dateTime().nullable()();
}

class StudySessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get nodeId => integer().customConstraint('NOT NULL REFERENCES nodes(id)')();
  DateTimeColumn get startedAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get endedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(
  tables: [Nodes, StudySessions],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/athena.sqlite');
    return NativeDatabase(file);
  });
}
