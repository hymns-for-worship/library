import 'dart:async';

import '../../domain/model/portion.dart';
import '../../domain/repository/base.dart';

typedef PortionData = (
  String portion,
  String lyrics,
  String hymnPortionId,
);

abstract class IPortionsRepository extends BaseRepository<Portion, PortionData> {
  IPortionsRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS portions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    lyrics TEXT NOT NULL,
    hymnPortionId TEXT,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnPortionId)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS portions_fts USING fts5(
    name,
    lyrics,
    content='portions',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS portions_insert
  AFTER INSERT ON portions
  BEGIN
    INSERT INTO portions_fts (rowid, name, lyrics)
    VALUES (new.id, new.name, new.lyrics);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS portions_update
  AFTER UPDATE ON portions
  BEGIN
    UPDATE portions_fts
    SET name = new.name, lyrics = new.lyrics
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS portions_delete
  AFTER DELETE ON portions
  BEGIN
    DELETE FROM portions_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight( portions_fts, 0, '<mark>', '</mark>') AS name,
    highlight( portions_fts, 1, '<mark>', '</mark>') AS lyrics,
    h.hymnPortionId AS hymnPortionId,
    h.lastModified AS lastModified
  FROM portions_fts
  INNER JOIN portions h ON portions_fts.rowid = h.id
  WHERE portions_fts MATCH ?
  ORDER BY rank
  ''';


  static const INSERT = '''
  INSERT INTO portions (name, lyrics, hymnPortionId, lastModified)
  VALUES (?, ?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM portions
  WHERE hymnPortionId = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM portions
  WHERE hymnPortionId = ?;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM portions;
  ''';

  static const DELETE = '''
  DELETE FROM portions
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM portions
  ORDER BY name ASC;
  ''';

  static const GET = '''
  SELECT * FROM portions
  WHERE id = ?;
  ''';

  static const GET_PORTIONS_FOR_HYMN = '''
  SELECT * FROM portions
  INNER JOIN hymn_portions ON portions.id = hymn_portions.portionId
  WHERE hymn_portions.hymnId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM portions;
  ''';

  FutureOr<List<Portion>> search(String query);

  FutureOr<List<Portion>> getPortionsForHymn(int hymnId);
}
