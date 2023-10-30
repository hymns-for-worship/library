import 'package:sqlite3/common.dart';

import '../../domain/model/portion.dart';
import '../../domain/repository/hymn_portions.dart';

class HymnPortionsRepository extends IHymnPortionsRepository {
  HymnPortionsRepository(this.database) : super([]);

  final CommonDatabase database;

  @override
  void createTable() {
    database.execute(IHymnPortionsRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create trigger on delete hymn
    database.execute(IHymnPortionsRepository.TRIGGER_HYMN_DELETE);
    // Create trigger on delete portion
    database.execute(IHymnPortionsRepository.TRIGGER_PORTION_DELETE);
  }

  @override
  void deleteAll() {
    database.execute(IHymnPortionsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnPortionsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<HymnPortion> getAll() {
    final rows = database.select(IHymnPortionsRepository.GET_ALL);
    return rows.map(HymnPortion.fromRow).toList();
  }

  @override
  List<int> getHymnIdsForPortion(int portionId) {
    final rows = database
        .select(IHymnPortionsRepository.GET_HYMN_IDS_FOR_PORTION, [portionId]);
    final hymnIds = <int>[];
    for (final row in rows) {
      hymnIds.add(row['hymnId'] as int);
    }
    return hymnIds;
  }

  @override
  HymnPortion? getById(int id) {
    final rows = database.select(IHymnPortionsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      return HymnPortion.fromRow(rows.first);
    }
    return null;
  }

  @override
  List<int> addAll(List<HymnPortionData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnPortionsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnPortionsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, portionId) = item;
      final results = find.select([hymnId, portionId]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, portionId, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnPortionData item) {
    final (hymnId, portionId) = item;
    database.execute(IHymnPortionsRepository.DELETE_FIND, [hymnId, portionId]);
    refresh();
  }

  @override
  int count() {
    final rows = database.select(IHymnPortionsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnPortionData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
