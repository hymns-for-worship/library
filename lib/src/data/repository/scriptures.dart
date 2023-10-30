import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/scriptures.dart';
import '../../domain/repository/scriptures.dart';

class ScripturesRepository extends IScripturesRepository {
  ScripturesRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IScripturesRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create fts5 virtual table
    database.execute(IScripturesRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(IScripturesRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(IScripturesRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(IScripturesRepository.SEARCH_DELETE);
  }

  @override
  List<Scripture> search(String query) {
    final rows = database.select(IScripturesRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Scripture.fromRow).toList();
  }

  @override
  List<Scripture> getScripturesForHymn(int hymnId) {
    final rows = database.select(
      IScripturesRepository.GET_SCRIPTURES_FOR_HYMN,
      [hymnId],
    );
    return rows.map(Scripture.fromRow).toList();
  }

  @override
  List<int> addAll(List<ScriptureData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IScripturesRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IScripturesRepository.FIND,
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
    database.execute(IScripturesRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IScripturesRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Scripture> getAll() {
    final rows = database.select(IScripturesRepository.GET_ALL);
    return rows.map(Scripture.fromRow).toList();
  }

  @override
  Scripture? getById(int id) {
    final rows = database.select(IScripturesRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Scripture.fromRow(row);
    }
    return null;
  }

  @override
  void delete(ScriptureData item) {
    database.execute(
      IScripturesRepository.DELETE_FIND,
      [item],
    );
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IScripturesRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(ScriptureData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
