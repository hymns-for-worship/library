import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/stakeholders.dart';
import '../../domain/repository/stakeholders.dart';

class StakeholdersRepository extends IStakeholdersRepository {
  StakeholdersRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IStakeholdersRepository.CREATE);
  }

  @override
  void createTriggers() {
    // Create fts5 virtual table
    database.execute(IStakeholdersRepository.SEARCH_CREATE);
    // Create trigger on insert
    database.execute(IStakeholdersRepository.SEARCH_INSERT);
    // Create trigger on update
    database.execute(IStakeholdersRepository.SEARCH_UPDATE);
    // Create trigger on delete
    database.execute(IStakeholdersRepository.SEARCH_DELETE);
  }

  @override
  List<Stakeholder> search(String query) {
   final rows = database.select(IStakeholdersRepository.SEARCH.replaceAll('?', "'\"$query\" * '"));
    return rows.map(Stakeholder.fromRow).toList();
  }

  @override
  List<Stakeholder> getStakeholdersForHymn(int hymnId) {
    final rows = database.select(IStakeholdersRepository.GET_STAKEHOLDERS_FOR_HYMN);
    return rows.map(Stakeholder.fromRow).toList();
  }

  @override
  List<int> addAll(List<StakeholderData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IStakeholdersRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IStakeholdersRepository.FIND,
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
    database.execute(IStakeholdersRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IStakeholdersRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Stakeholder> getAll() {
    final rows = database.select(IStakeholdersRepository.GET_ALL);
    return rows.map(Stakeholder.fromRow).toList();
  }

  @override
  Stakeholder? getById(int id) {
    final rows = database.select(IStakeholdersRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Stakeholder.fromRow(row);
    }
    return null;
  }

  @override
  void delete(StakeholderData item) {
    database.execute(IStakeholdersRepository.DELETE, [item]);
    refresh();
  }

  @override
  List<StakeholderWithRelationship> getStakeholdersWithRelationshipForHymn(int hymnId) {
    final stmt = database.prepare(IStakeholdersRepository.GET_STAKEHOLDERS_WITH_RELATIONSHIP_FOR_HYMN);
    final stakeholders = <(Stakeholder, String)>[];
    for (final row in stmt.select([hymnId])) {
      stakeholders.add((
        Stakeholder.fromRow(row),
        row['relationship'] as String,
      ));
    }
    return stakeholders;
  }

  @override
  int count() {
    final rows = database.select(IStakeholdersRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(StakeholderData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
