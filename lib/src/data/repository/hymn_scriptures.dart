import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/scriptures.dart';
import '../../domain/repository/hymn_scriptures.dart';

class HymnScripturesRepository extends IHymnScripturesRepository {
  HymnScripturesRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IHymnScripturesRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create trigger on delete hymn
    database.execute(IHymnScripturesRepository.TRIGGER_HYMN_DELETE);
    // Create trigger on delete scripture
    database.execute(IHymnScripturesRepository.TRIGGER_SCRIPTURE_DELETE);
  }

  @override
  void deleteAll() {
    database.execute(IHymnScripturesRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnScripturesRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<HymnScripture> getAll() {
    final rows = database.select(IHymnScripturesRepository.GET_ALL);
    return rows.map(HymnScripture.fromRow).toList();
  }

  @override
  List<int> getHymnIdsForScripture(int scriptureId) {
    final rows = database.select(IHymnScripturesRepository.GET_HYMN_IDS_FOR_SCRIPTURE, [scriptureId]);
    final hymnIds = <int>[];
    for (final row in rows) {
      hymnIds.add(row['hymnId'] as int);
    }
    return hymnIds;
  }

  @override
  HymnScripture? getById(int id) {
    final rows = database.select(IHymnScripturesRepository.GET, [id]);
    if (rows.isNotEmpty) {
      return HymnScripture.fromRow(rows.first);
    }
    return null;
  }

  @override
  List<int> addAll(List<HymnScriptureData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnScripturesRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnScripturesRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, scriptureId) = item;
      final results = find.select([hymnId, scriptureId]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, scriptureId, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnScriptureData item) {
    final (hymnId, scriptureId) = item;
    database.execute(IHymnScripturesRepository.DELETE, [hymnId, scriptureId]);
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IHymnScripturesRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnScriptureData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
