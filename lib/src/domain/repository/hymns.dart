import 'dart:async';

import '../../domain/model/hymn.dart';
import '../../domain/repository/base.dart';

typedef HymnData = ({
  String title,
  String number,
  String? tuneName,
  String? startingKey,
  String? beatPattern,
  String? startingPitch,
  String? startingBeat,
  String? startingPitchDirection,
  String? timeSignature,
  String? complexTimeSignature,
  bool downloaded,
});

abstract class IHymnsRepository extends BaseRepository<Hymn, HymnData> {
  IHymnsRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS hymns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    number TEXT NOT NULL,
    tuneName TEXT,
    startingKey TEXT,
    beatPattern TEXT,
    startingPitch TEXT,
    startingBeat TEXT,
    startingPitchDirection TEXT,
    timeSignature TEXT,
    complexTimeSignature TEXT,
    downloaded INTEGER DEFAULT 0,
    lastModified TEXT NOT NULL,
    UNIQUE (title, number)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS hymns_fts USING fts5(
    title,
    number,
    tuneName,
    startingKey,
    beatPattern,
    startingPitch,
    startingBeat,
    startingPitchDirection,
    timeSignature,
    complexTimeSignature,
    content='hymns',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS hymns_insert
  AFTER INSERT ON hymns
  BEGIN
    INSERT INTO hymns_fts (rowid, title, number, tuneName, startingKey, beatPattern, startingPitch, startingBeat, startingPitchDirection, timeSignature, complexTimeSignature)
    VALUES (new.id, new.title, new.number, new.tuneName, new.startingKey, new.beatPattern, new.startingPitch, new.startingBeat, new.startingPitchDirection, new.timeSignature, new.complexTimeSignature);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS hymns_update
  AFTER UPDATE ON hymns
  BEGIN
    UPDATE hymns_fts
    SET title = new.title, number = new.number, tuneName = new.tuneName, startingKey = new.startingKey, beatPattern = new.beatPattern, startingPitch = new.startingPitch, startingBeat = new.startingBeat, startingPitchDirection = new.startingPitchDirection, timeSignature = new.timeSignature, complexTimeSignature = new.complexTimeSignature
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS hymns_delete
  AFTER DELETE ON hymns
  BEGIN
    DELETE FROM hymns_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight(hymns_fts, 0, '<mark>', '</mark>') AS title,
    highlight(hymns_fts, 1, '<mark>', '</mark>') AS number,
    highlight(hymns_fts, 2, '<mark>', '</mark>') AS tuneName,
    highlight(hymns_fts, 3, '<mark>', '</mark>') AS startingKey,
    highlight(hymns_fts, 4, '<mark>', '</mark>') AS beatPattern,
    highlight(hymns_fts, 5, '<mark>', '</mark>') AS startingPitch,
    highlight(hymns_fts, 6, '<mark>', '</mark>') AS startingBeat,
    highlight(hymns_fts, 7, '<mark>', '</mark>') AS startingPitchDirection,
    highlight(hymns_fts, 8, '<mark>', '</mark>') AS timeSignature,
    highlight(hymns_fts, 9, '<mark>', '</mark>') AS complexTimeSignature,
    h.downloaded AS downloaded,
    h.lastModified AS lastModified
  FROM hymns_fts
  INNER JOIN hymns h ON hymns_fts.rowid = h.id
  WHERE hymns_fts MATCH ?
  ORDER BY rank
  ''';

  static const INSERT = '''
  INSERT INTO hymns (
    title,
    number,
    tuneName,
    startingKey,
    beatPattern,
    startingPitch,
    startingBeat,
    startingPitchDirection,
    timeSignature,
    complexTimeSignature,
    lastModified
  )
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM hymns
  WHERE title = ? AND number = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM hymns
  WHERE title = ? AND number = ?;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM hymns;
  ''';

  static const DELETE = '''
  DELETE FROM hymns
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM hymns;
  ''';

  static const GET = '''
  SELECT * FROM hymns
  WHERE id = ?;
  ''';

  static const SET_DOWNLOADED = '''
  UPDATE hymns
  SET downloaded = ?, lastModified = ?
  WHERE id = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM hymns;
  ''';

  FutureOr<List<Hymn>> search(String query);

  FutureOr<void> setDownloaded(int hymnId, bool downloaded, DateTime date);
}
