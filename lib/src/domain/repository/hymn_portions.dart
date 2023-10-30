import 'dart:async';

import '../../domain/model/portion.dart';
import '../../domain/repository/base.dart';

typedef HymnPortionData = (int hymnId, int portionId);

abstract class IHymnPortionsRepository extends BaseRepository<HymnPortion, HymnPortionData> {
  IHymnPortionsRepository(super.value);

  static const TABLE = 'hymn_portions';

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hymnId INTEGER NOT NULL,
    portionId INTEGER NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnId, portionId)
  );
  ''';

  static const TRIGGER_HYMN_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_hymn_delete
  AFTER DELETE ON hymns
  BEGIN
    DELETE FROM $TABLE
    WHERE hymnId = OLD.id;
  END;
  ''';

  static const TRIGGER_PORTION_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_portion_delete
  AFTER DELETE ON portions
  BEGIN
    DELETE FROM $TABLE
    WHERE portionId = OLD.id;
  END;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM $TABLE;
  ''';

  static const DELETE = '''
  DELETE FROM $TABLE
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM $TABLE;
  ''';

  static const GET_HYMN_IDS_FOR_PORTION = '''
  SELECT * FROM $TABLE
  WHERE portionId = ?;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, portionId, lastModified)
  VALUES (?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND portionId = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND portionId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  FutureOr<List<int>> getHymnIdsForPortion(int portionId);
}
