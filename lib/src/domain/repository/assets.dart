import 'dart:typed_data';

import '../../domain/model/assets.dart';
import 'base.dart';

typedef AssetData = (int hymnId, String path, Uint8List bytes);

abstract class IAssetsRepository extends BaseRepository<Asset, AssetData> {
  IAssetsRepository(super.value);

  static const TABLE = 'assets';

  static const CREATE_TABLE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    path TEXT NOT NULL,
    bytes BLOB,
    hymnId INTEGER NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (path, hymnId)
  );
  ''';
  static const CREATE_TRIGGER_DELETE_HYMN = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_hymn_delete
  AFTER DELETE ON hymns
  BEGIN
    DELETE FROM $TABLE
    WHERE hymnId = OLD.id;
  END;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, path, bytes, lastModified)
  VALUES (?, ?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND path = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND path = ?;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM $TABLE;
  ''';

  static const DELETE = '''
  DELETE FROM $TABLE
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM $TABLE
  ORDER BY path ASC;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const DELETE_BY_HYMN = '''
  DELETE FROM $TABLE
  WHERE hymnId = ?;
  ''';

  static const GET_BY_HYMN = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  Uint8List? getAssetBytesById(int assetId);

  void removeAssetByHymnId(int hymnId);

  List<Asset> getAssetForHymnId(int hymnId);
}
