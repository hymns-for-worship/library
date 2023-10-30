import 'package:sqlite3/common.dart';

import '../../domain/model/topics.dart';
import '../../domain/repository/hymn_topics.dart';

class HymnTopicsRepository extends IHymnTopicsRepository {
  HymnTopicsRepository(this.database) : super([]);

  final CommonDatabase database;

  @override
  void createTable() {
    database.execute(IHymnTopicsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create trigger on delete hymn
    database.execute(IHymnTopicsRepository.TRIGGER_HYMN_DELETE);
    // Create trigger on delete topic
    database.execute(IHymnTopicsRepository.TRIGGER_TOPIC_DELETE);
  }

  @override
  void deleteAll() {
    database.execute(IHymnTopicsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnTopicsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<HymnTopic> getAll() {
    final rows = database.select(IHymnTopicsRepository.GET_ALL);
    return rows.map(HymnTopic.fromRow).toList();
  }

  @override
  List<int> getHymnIdsForTopic(int topicId) {
    final rows = database
        .select(IHymnTopicsRepository.GET_HYMN_IDS_FOR_TOPIC, [topicId]);
    final hymnIds = <int>[];
    for (final row in rows) {
      hymnIds.add(row['hymnId'] as int);
    }
    return hymnIds;
  }

  @override
  HymnTopic? getById(int id) {
    final rows = database.select(IHymnTopicsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      return HymnTopic.fromRow(rows.first);
    }
    return null;
  }

  @override
  List<int> addAll(List<HymnTopicData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnTopicsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnTopicsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, topicId) = item;
      final results = find.select([hymnId, topicId]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, topicId, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnTopicData item) {
    final (hymnId, topicId) = item;
    database.execute(
      IHymnTopicsRepository.DELETE_FIND,
      [hymnId, topicId],
    );
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IHymnTopicsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnTopicData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
