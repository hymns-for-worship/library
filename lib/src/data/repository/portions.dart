import 'package:sqlite3/common.dart';

import '../../domain/model/portion.dart';
import '../../domain/repository/portions.dart';

class PortionsRepository extends IPortionsRepository {
  PortionsRepository(this.database) : super([]);

  final CommonDatabase database;

  @override
  void createTable() {
    database.execute(IPortionsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create fts5 virtual table
    database.execute(IPortionsRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(IPortionsRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(IPortionsRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(IPortionsRepository.SEARCH_DELETE);
  }

  @override
  List<Portion> search(String query) {
    final rows = database
        .select(IPortionsRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Portion.fromRow).toList();
  }

  @override
  List<int> addAll(List<PortionData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IPortionsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IPortionsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (portion, lyrics, hymnPortionId) = item;
      final results = find.select([hymnPortionId]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute(
          [portion, lyrics, hymnPortionId, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(PortionData item) {
    final (_, _, hymnPortionId) = item;
    database.execute(IPortionsRepository.DELETE_FIND, [hymnPortionId]);
    refresh();
  }

  @override
  void deleteAll() {
    database.execute(IPortionsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IPortionsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Portion> getAll() {
    final rows = database.select(IPortionsRepository.GET_ALL);
    return rows.map(Portion.fromRow).toList();
  }

  @override
  Portion? getById(int id) {
    final rows = database.select(IPortionsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Portion.fromRow(row);
    }
    return null;
  }

  @override
  List<Portion> getPortionsForHymn(int hymnId) {
    final stmt = database.prepare(IPortionsRepository.GET_PORTIONS_FOR_HYMN);
    final portions = <Portion>[];
    for (final row in stmt.select([hymnId])) {
      portions.add(Portion.fromRow(row));
    }
    return portions;
  }

  @override
  int count() {
    final rows = database.select(IPortionsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(PortionData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
