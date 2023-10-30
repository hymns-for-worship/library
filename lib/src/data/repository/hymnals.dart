import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/hymnal.dart';
import '../../domain/repository/hymnals.dart';

class HymnalsRepository extends IHymnalsRepository {
  HymnalsRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IHymnalsRepository.CREATE);
  }

  @override
  void createTriggers() {
    database.execute(IHymnalsRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(IHymnalsRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(IHymnalsRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(IHymnalsRepository.SEARCH_DELETE);
  }

  @override
  List<Hymnal> search(String query) {
    final rows = database.select(IHymnalsRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Hymnal.fromRow).toList();
  }

  @override
  List<int> addAll(List<HymnalData> items) {
    final ids = <int>[];
    final find = database.prepare(
      IHymnalsRepository.FIND,
      persistent: true,
    );
    final add = database.prepare(
      IHymnalsRepository.INSERT,
      persistent: true,
    );
    for (final item in items) {
      final (name, alias) = item;
      final results = find.select([name, alias]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([name, alias, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnalData item) {
    final (name, alias) = item;
    database.execute(IHymnalsRepository.DELETE_FIND, [name, alias]);
  }

  @override
  void deleteAll() {
    database.execute(IHymnalsRepository.DELETE_ALL);
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnalsRepository.DELETE, [id]);
  }

  @override
  List<Hymnal> getAll() {
    final rows = database.select(IHymnalsRepository.GET_ALL);
    return rows.map(Hymnal.fromRow).toList();
  }

  @override
  Hymnal? getById(int id) {
    final rows = database.select(IHymnalsRepository.GET, [id]);
    if (rows.isEmpty) return null;
    final row = rows.first;
    return Hymnal.fromRow(row);
  }

  @override
  List<Hymnal> getHymnalsForHymn(int hymnId) {
    final stmt = database.prepare(IHymnalsRepository.GET_HYMNALS_FOR_HYMN);
    final hymnals = <Hymnal>[];
    for (final row in stmt.select([hymnId])) {
      hymnals.add(Hymnal.fromRow(row));
    }
    return hymnals;
  }

  @override
  Hymnal? getHymnalForHymn(int hymnId) {
    final stmt = database.prepare(IHymnalsRepository.GET_HYMNAL_FOR_HYMN);
    final results = stmt.select([hymnId]);
    if (results.isEmpty) return null;
    final row = results.first;
    return Hymnal.fromRow(row);
  }

  @override
  int count() {
    final rows = database.select(IHymnalsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnalData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
