import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../data/source/database/database.dart';

class GetUserHistory {
  final HfwDatabase db;
  GetUserHistory(this.db);

  Stream<List<(Hymn, DateTime)>> call(String userId) async* {
    final stream = db.getRecordModelsByCollection('analytics').watch();
    await for (final items in stream) {
      final hymnIds = items
          .where((e) => e.data.contains('view_hymn'))
          .map((e) => jsonDecode(e.data) as Map<String, dynamic>)
          .where((e) => e['user'] == userId)
          .map((e) => e['metadata'] as Map<String, dynamic>? ?? {})
          .map((e) {
            final hymnId = e['hymn_id'] as String? ?? '';
            final viewDate =
                DateTime.tryParse(e['view_date'] as String? ?? '') ??
                    DateTime.now();
            return (hymnId, viewDate);
          })
          .where((e) => e.$1.isNotEmpty)
          .toList();
      final hymns = await db.getHymns().get();
      final results = <(Hymn, DateTime)>[];
      for (final (id, date) in hymnIds) {
        final hymn = hymns.firstWhereOrNull((e) => e.id == id);
        if (hymn != null) results.add((hymn, date));
      }
      yield results.reversed.toList();
    }
  }
}
