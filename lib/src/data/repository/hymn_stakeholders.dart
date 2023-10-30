import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/stakeholders.dart';
import '../../domain/repository/hymn_stakeholders.dart';

class HymnStakeholdersRepository extends IHymnStakeholdersRepository {
  HymnStakeholdersRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IHymnStakeholdersRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create trigger on delete hymn
    database.execute(IHymnStakeholdersRepository.TRIGGER_DELETE_HYMN);
    // Create trigger on delete stakeholder
    database.execute(IHymnStakeholdersRepository.TRIGGER_DELETE_STAKEHOLDER);
  }

  @override
  List<int> addAll(List<HymnStakeholderData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IHymnStakeholdersRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IHymnStakeholdersRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, stakeholderId, relationship) = item;
      final results = find.select([hymnId, stakeholderId, relationship]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, stakeholderId, relationship, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(HymnStakeholderData item) {
    final (hymnId, stakeholderId, relationship) = item;
    database.execute(IHymnStakeholdersRepository.DELETE_FIND, [hymnId, stakeholderId, relationship]);
    refresh();
  }

  @override
  void deleteAll() {
    database.execute(IHymnStakeholdersRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IHymnStakeholdersRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<HymnStakeholder> getAll() {
    final rows = database.select(IHymnStakeholdersRepository.GET_ALL);
    return rows.map(HymnStakeholder.fromRow).toList();
  }

  @override
  HymnStakeholder? getById(int id) {
    final rows = database.select(IHymnStakeholdersRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return HymnStakeholder.fromRow(row);
    }
    return null;
  }

  @override
  List<int> getHymnIdsForStakeholder(int stakeholderId) {
    final stmt = database.prepare(IHymnStakeholdersRepository.GET_HYMN_IDS_FOR_STAKEHOLDER);
    final hymnIds = <int>{};
    for (final row in stmt.select([stakeholderId])) {
      hymnIds.add(row['hymnId'] as int);
    }
    return hymnIds.toList();
  }

  @override
  int count() {
    final rows = database.select(IHymnStakeholdersRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(HymnStakeholderData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
