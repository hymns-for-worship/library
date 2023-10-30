import 'dart:async';

import '../../domain/model/scriptures.dart';
import '../../domain/repository/base.dart';

typedef HymnScriptureData = (int hymnId, int scriptureId);

abstract class IHymnScripturesRepository extends BaseRepository<HymnScripture, HymnScriptureData> {
  IHymnScripturesRepository(super.value);

  static const TABLE = 'hymn_scriptures';

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hymnId INTEGER NOT NULL,
    scriptureId INTEGER NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnId, scriptureId)
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

  static const TRIGGER_SCRIPTURE_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_scripture_delete
  AFTER DELETE ON scriptures
  BEGIN
    DELETE FROM $TABLE
    WHERE scriptureId = OLD.id;
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

  static const GET_HYMN_IDS_FOR_SCRIPTURE = '''
  SELECT * FROM $TABLE
  WHERE scriptureId = ?;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, scriptureId, lastModified)
  VALUES (?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND scriptureId = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND scriptureId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  FutureOr<List<int>> getHymnIdsForScripture(int scriptureId);
}
