import 'dart:async';

import '../../domain/model/hymnal.dart';
import '../../domain/repository/base.dart';

typedef HymnHymnalData = (int hymnId, int hymnalId);

abstract class IHymnHymnalsRepository extends BaseRepository<HymnHymnal, HymnHymnalData> {
  IHymnHymnalsRepository(super.value);

  static const TABLE = 'hymn_hymnals';

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hymnId INTEGER NOT NULL,
    hymnalId INTEGER NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnId, hymnalId)
  );
  ''';

  static const TRIGGER_DELETE_HYMNAL = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_hymnal_delete
  AFTER DELETE ON hymnals
  BEGIN
    DELETE FROM $TABLE
    WHERE hymnalId = OLD.id;
  END;
  ''';

  static const TRIGGER_DELETE_HYMN = '''
    CREATE TRIGGER IF NOT EXISTS ${TABLE}_hymn_delete
    AFTER DELETE ON hymns
    BEGIN
      DELETE FROM $TABLE
      WHERE hymnId = OLD.id;
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

  static const GET_HYMN_IDS_FOR_HYMNAL = '''
  SELECT * FROM $TABLE
  WHERE hymnalId = ?;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, hymnalId, lastModified)
  VALUES (?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND hymnalId = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND hymnalId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  FutureOr<List<int>> getHymnIdsForHymnal(int hymnalId);
}
