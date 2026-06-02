import '../database/app_database.dart' as db;

class StudySessionEntry {
  final int id;
  final int nodeId;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? notes;
  final DateTime createdAt;

  const StudySessionEntry({
    required this.id,
    required this.nodeId,
    required this.startedAt,
    this.endedAt,
    this.notes,
    required this.createdAt,
  });

  bool get isActive => endedAt == null;

  Duration elapsedAt(DateTime now) {
    return (endedAt ?? now).difference(startedAt);
  }

  String formattedElapsed(DateTime now) {
    final duration = elapsedAt(now);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}

extension StudySessionDataMapper on db.StudySession {
  StudySessionEntry toEntry() {
    return StudySessionEntry(
      id: id,
      nodeId: nodeId,
      startedAt: startedAt,
      endedAt: endedAt,
      notes: notes,
      createdAt: createdAt,
    );
  }
}
