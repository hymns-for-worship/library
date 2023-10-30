import 'package:sqlite3/common.dart';

import '../../domain/model/topics.dart';
import '../../domain/repository/topics.dart';

class TopicsRepository extends ITopicsRepository {
  TopicsRepository(this.database) : super([]);

  final CommonDatabase database;

  @override
  void createTable() {
    database.execute(ITopicsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create fts5 virtual table
    database.execute(ITopicsRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(ITopicsRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(ITopicsRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(ITopicsRepository.SEARCH_DELETE);
  }

  @override
  List<Topic> search(String query) {
    final rows = database
        .select(ITopicsRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Topic.fromRow).toList();
  }

  @override
  List<Topic> getTopicsForHymn(int hymnId) {
    final rows =
        database.select(ITopicsRepository.GET_TOPICS_FOR_HYMN, [hymnId]);
    return rows.map(Topic.fromRow).toList();
  }

  @override
  List<int> addAll(List<TopicData> items) {
    final ids = <int>[];
    final add = database.prepare(
      ITopicsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      ITopicsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final results = find.select([item]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([item, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void deleteAll() {
    database.execute(ITopicsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(ITopicsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Topic> getAll() {
    final rows = database.select(ITopicsRepository.GET_ALL);
    return rows.map(Topic.fromRow).toList();
  }

  @override
  Topic? getById(int id) {
    final rows = database.select(ITopicsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Topic.fromRow(row);
    }
    return null;
  }

  @override
  void delete(TopicData item) {
    database.execute(ITopicsRepository.DELETE_FIND, [item]);
    refresh();
  }

  @override
  int count() {
    final rows = database.select(ITopicsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(TopicData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
