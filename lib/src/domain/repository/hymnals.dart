import 'dart:async';

import '../../domain/model/hymnal.dart';
import '../../domain/repository/base.dart';

typedef HymnalData = (String name, String alias);

abstract class IHymnalsRepository extends BaseRepository<Hymnal, HymnalData> {
  IHymnalsRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS hymnals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    alias TEXT NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (name, alias)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS hymnals_fts USING fts5(
    name,
    alias,
    content='hymnals',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS hymnals_insert
  AFTER INSERT ON hymnals
  BEGIN
    INSERT INTO hymnals_fts (rowid, name, alias)
    VALUES (new.id, new.name, new.alias);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS hymnals_update
  AFTER UPDATE ON hymnals
  BEGIN
    UPDATE hymnals_fts
    SET name = new.name, alias = new.alias
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS hymnals_delete
  AFTER DELETE ON hymnals
  BEGIN
    DELETE FROM hymnals_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight(hymnals_fts, 0, '<mark>', '</mark>') AS name,
    highlight(hymnals_fts, 1, '<mark>', '</mark>') AS alias,
    h.lastModified AS lastModified
  FROM hymnals_fts
  INNER JOIN hymnals h ON hymnals_fts.rowid = h.id
  WHERE hymnals_fts MATCH ?
  ORDER BY rank
  ''';

  static const FIND = '''
  SELECT * FROM hymnals
  WHERE name = ? AND alias = ?;
  ''';

  static const INSERT = '''
  INSERT INTO hymnals (name, alias, lastModified)
  VALUES (?, ?, ?);
  ''';

  static const DELETE_FIND = '''
  DELETE FROM hymnals
  WHERE name = ? AND alias = ?;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM hymnals;
  ''';

  static const DELETE = '''
  DELETE FROM hymnals
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM hymnals
  ORDER BY name ASC;
  ''';

  static const GET = '''
  SELECT * FROM hymnals
  WHERE id = ?;
  ''';

  static const GET_HYMNALS_FOR_HYMN = '''
  SELECT * FROM hymnals
  INNER JOIN hymn_hymnals ON hymnals.id = hymn_hymnals.hymnalId
  WHERE hymn_hymnals.hymnId = ?;
  ''';

  static const GET_HYMNAL_FOR_HYMN = '''
  SELECT * FROM hymnals
  INNER JOIN hymn_hymnals ON hymnals.id = hymn_hymnals.hymnalId
  WHERE hymn_hymnals.hymnId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM hymnals;
  ''';

  FutureOr<List<Hymnal>> search(String query);

  FutureOr<List<Hymnal>> getHymnalsForHymn(int hymnId);

  FutureOr<Hymnal?> getHymnalForHymn(int hymnId);
}
