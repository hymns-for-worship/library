import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/hymnal.dart';
import '../../domain/repository/hymn_hymnals.dart';

class HymnHymnalsRepository extends IHymnHymnalsRepository {
  HymnHymnalsRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IHymnHymnalsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create trigger on delete hymnal
    database.execute(IHymnHymnalsRepository.TRIGGER_DELETE_HYMNAL);
    // Create trigger on delete hymn
    database.execute(IHymnHymnalsRepository.TRIGGER_DELETE_HYMN);
  }

  @override
  void deleteAll() {
    database.execute(IHymnHymnalsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnHymnalsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<HymnHymnal> getAll() {
    final rows = database.select(IHymnHymnalsRepository.GET_ALL);
    return rows.map(HymnHymnal.fromRow).toList();
  }

  @override
  List<int> getHymnIdsForHymnal(int hymnalId) {
    final rows = database.select(IHymnHymnalsRepository.GET_HYMN_IDS_FOR_HYMNAL, [hymnalId]);
    final hymnIds = <int>[];
    for (final row in rows) {
      hymnIds.add(row['hymnId'] as int);
    }
    return hymnIds;
  }

  @override
  HymnHymnal? getById(int id) {
    final rows = database.select(IHymnHymnalsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      return HymnHymnal.fromRow(rows.first);
    }
    return null;
  }

  @override
  List<int> addAll(List<HymnHymnalData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnHymnalsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnHymnalsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, hymnalId) = item;
      final results = find.select([hymnId, hymnalId]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, hymnalId, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnHymnalData item) {
    final (hymnId, hymnalId) = item;
    database.execute(
      IHymnHymnalsRepository.DELETE_FIND,
      [hymnId, hymnalId],
    );
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IHymnHymnalsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnHymnalData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
