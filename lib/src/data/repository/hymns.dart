import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/hymn.dart';
import '../../domain/repository/hymns.dart';

class HymnsRepository extends IHymnsRepository {
  HymnsRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IHymnsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create fts5 virtual table
    database.execute(IHymnsRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(IHymnsRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(IHymnsRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(IHymnsRepository.SEARCH_DELETE);
  }

  @override
  List<Hymn> search(String query) {
    final rows = database.select(IHymnsRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Hymn.fromRow).toList();
  }

  @override
  List<int> addAll(List<HymnData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final results = find.select([item.title, item.number]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([
        item.title,
        item.number,
        item.tuneName,
        item.startingKey,
        item.beatPattern,
        item.startingPitch,
        item.startingBeat,
        item.startingPitchDirection,
        item.timeSignature,
        item.complexTimeSignature,
        DateTime.now().toIso8601String(),
      ]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnData item) {
    final stmt = database.prepare(IHymnsRepository.DELETE_FIND);
    stmt.execute([item.title, item.number]);
    refresh();
  }

  @override
  void deleteAll() {
    database.execute(IHymnsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Hymn> getAll() {
    final rows = database.select(IHymnsRepository.GET_ALL);
    return rows.map(Hymn.fromRow).toList();
  }

  @override
  Hymn? getById(int id) {
    final rows = database.select(IHymnsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Hymn.fromRow(row);
    }
    return null;
  }

  @override
  void setDownloaded(int hymnId, bool downloaded, DateTime date) {
    database.execute(
      IHymnsRepository.SET_DOWNLOADED,
      [downloaded ? 1 : 0, date.toIso8601String(), hymnId],
    );
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IHymnsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
