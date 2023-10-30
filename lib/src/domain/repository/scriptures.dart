import 'dart:async';

import '../../domain/model/scriptures.dart';
import '../../domain/repository/base.dart';

typedef ScriptureData = String;

abstract class IScripturesRepository extends BaseRepository<Scripture, ScriptureData> {
  IScripturesRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS scriptures (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (name)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS scriptures_fts USING fts5(
    name,
    content='scriptures',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS scriptures_insert
  AFTER INSERT ON scriptures
  BEGIN
    INSERT INTO scriptures_fts (rowid, name)
    VALUES (new.id, new.name);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS scriptures_update
  AFTER UPDATE ON scriptures
  BEGIN
    UPDATE scriptures_fts
    SET name = new.name
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS scriptures_delete
  AFTER DELETE ON scriptures
  BEGIN
    DELETE FROM scriptures_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight(scriptures_fts, 0, '<mark>', '</mark>') AS name,
    h.lastModified AS lastModified
  FROM scriptures_fts
  INNER JOIN scriptures h ON scriptures_fts.rowid = h.id
  WHERE scriptures_fts MATCH ?
  ORDER BY rank
  ''';

  static const INSERT = '''
  INSERT INTO scriptures (name, lastModified)
  VALUES (?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM scriptures
  WHERE name = ?
  ORDER BY name ASC;
  ''';

  static const GET_SCRIPTURES_FOR_HYMN = '''
  SELECT * FROM scriptures
  INNER JOIN hymn_scriptures ON scriptures.id = hymn_scriptures.scriptureId
  WHERE hymn_scriptures.hymnId = ?
  ORDER BY name ASC;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM scriptures;
  ''';

  static const DELETE = '''
  DELETE FROM scriptures
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM scriptures
  ORDER BY name ASC;
  ''';

  static const GET = '''
  SELECT * FROM scriptures
  WHERE id = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM scriptures
  WHERE name = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM scriptures;
  ''';

  FutureOr<List<Scripture>> search(String query);

  FutureOr<List<Scripture>> getScripturesForHymn(int hymnId);
}
