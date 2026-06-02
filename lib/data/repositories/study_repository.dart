import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'node_repository.dart' show databaseProvider;
import '../database/app_database.dart' as db;
import '../models/study_session.dart';

final studyRepositoryProvider = Provider<StudyRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return StudyRepository(database);
});

final activeStudySessionProvider = FutureProvider<StudySessionEntry?>((ref) {
  return ref.watch(studyRepositoryProvider).getActiveSession();
});

class StudyRepository {
  final db.AppDatabase _database;

  StudyRepository(this._database);

  Future<StudySessionEntry?> getActiveSession() async {
    final query = _database.select(_database.studySessions)
      ..where((tbl) => tbl.endedAt.isNull());
    final row = await query.getSingleOrNull();
    return row?.toEntry();
  }

  Future<List<StudySessionEntry>> getSessionsForNode(int nodeId) async {
    final query = _database.select(_database.studySessions)
      ..where((tbl) => tbl.nodeId.equals(nodeId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.startedAt, mode: OrderingMode.desc)]);
    final rows = await query.get();
    return rows.map((row) => row.toEntry()).toList();
  }

  Future<int> startSession({
    required int nodeId,
    String? notes,
  }) async {
    final active = await getActiveSession();
    if (active != null) {
      throw StateError('Já existe uma sessão de estudo ativa.');
    }

    final companion = db.StudySessionsCompanion(
      nodeId: Value(nodeId),
      startedAt: Value(DateTime.now()),
      endedAt: const Value.absent(),
      notes: Value(notes),
      createdAt: Value(DateTime.now()),
    );

    return _database.into(_database.studySessions).insert(companion);
  }

  Future<int> stopSession(int sessionId) async {
    return (_database.update(_database.studySessions)
          ..where((tbl) => tbl.id.equals(sessionId)))
        .write(db.StudySessionsCompanion(
          endedAt: Value(DateTime.now()),
        ));
  }

  Future<int> stopActiveSession() async {
    final active = await getActiveSession();
    if (active == null) {
      return 0;
    }
    return stopSession(active.id);
  }
}
