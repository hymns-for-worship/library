import 'dart:typed_data';

import 'package:sqlite3/sqlite3.dart';

import '../../domain/model/assets.dart';
import '../../domain/repository/assets.dart';

class AssetsRepository extends IAssetsRepository {
  AssetsRepository(this.database) : super([]);

  final Database database;

  @override
  void createTable() {
    database.execute(IAssetsRepository.CREATE_TABLE);
  }

  @override
  void createTriggers() {
    database.execute(IAssetsRepository.CREATE_TRIGGER_DELETE_HYMN);
  }

  @override
  List<int> addAll(List<AssetData> items) {
    final ids = <int>[];
    final add = database.prepare(
      IAssetsRepository.INSERT,
      persistent: true,
    );
    final find = database.prepare(
      IAssetsRepository.FIND,
      persistent: true,
    );
    for (final item in items) {
      final (hymnId, path, bytes) = item;
      final results = find.select([hymnId, path]);
      if (results.isNotEmpty) {
        final row = results.first;
        ids.add(row['id'] as int);
        continue;
      }
      add.execute([hymnId, path, bytes, DateTime.now().toIso8601String()]);
      ids.add(database.lastInsertRowId);
    }
    add.dispose();
    find.dispose();
    refresh();
    return ids;
  }

  @override
  void delete(AssetData item) {
    final (hymnId, path, _) = item;
    database.execute(IAssetsRepository.DELETE_FIND, [hymnId, path]);
  }

  @override
  void deleteAll() {
    database.execute(IAssetsRepository.DELETE_ALL);
    refresh();
  }

  @override
  void deleteById(int id) {
    database.execute(IAssetsRepository.DELETE, [id]);
    refresh();
  }

  @override
  List<Asset> getAll() {
    final rows = database.select(IAssetsRepository.GET_ALL);
    return rows.map(Asset.fromRow).toList();
  }

  @override
  Asset? getById(int id) {
    final rows = database.select(IAssetsRepository.GET, [id]);
    if (rows.isNotEmpty) {
      final row = rows.first;
      return Asset.fromRow(row);
    }
    return null;
  }

  @override
  Uint8List? getAssetBytesById(int assetId) {
    final stmt = database.prepare(IAssetsRepository.GET);
    final results = stmt.select([assetId]);
    if (results.isNotEmpty) {
      final row = results.first;
      final list = row['bytes'] as List<int>;
      return Uint8List.fromList(list);
    }
    return null;
  }

  @override
  void removeAssetByHymnId(int hymnId) {
    database.execute(IAssetsRepository.DELETE_BY_HYMN, [hymnId]);
    refresh();
  }

  @override
  List<Asset> getAssetForHymnId(int hymnId) {
    final rows = database.select(IAssetsRepository.GET_BY_HYMN, [hymnId]);
    return rows.map(Asset.fromRow).toList();
  }

  @override
  int count() {
    final rows = database.select(IAssetsRepository.COUNT);
    final row = rows.first;
    return row['COUNT(*)'] as int;
  }

  @override
  int add(AssetData item) {
    final items = addAll([item]);
    return items.first;
  }

  @override
  void refresh() => value = getAll();
}
