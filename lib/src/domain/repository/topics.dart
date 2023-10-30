import 'dart:async';

import '../../domain/model/topics.dart';
import '../../domain/repository/base.dart';

typedef TopicData = String;

abstract class ITopicsRepository extends BaseRepository<Topic, TopicData> {
  ITopicsRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS topics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (name)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS topics_fts USING fts5(
    name,
    content='topics',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS topics_insert
  AFTER INSERT ON topics
  BEGIN
    INSERT INTO topics_fts (rowid, name)
    VALUES (new.id, new.name);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS topics_update
  AFTER UPDATE ON topics
  BEGIN
    UPDATE topics_fts
    SET name = new.name
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS topics_delete
  AFTER DELETE ON topics
  BEGIN
    DELETE FROM topics_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight(topics_fts, 0, '<mark>', '</mark>') AS name,
    h.lastModified AS lastModified
  FROM topics_fts
  INNER JOIN topics h ON topics_fts.rowid = h.id
  WHERE topics_fts MATCH ?
  ORDER BY rank
  ''';

  static const GET_TOPICS_FOR_HYMN = '''
  SELECT * FROM topics
  INNER JOIN hymn_topics ON topics.id = hymn_topics.topicId
  WHERE hymn_topics.hymnId = ?
  ORDER BY name ASC;
  ''';

  static const INSERT = '''
  INSERT INTO topics (name, lastModified)
  VALUES (?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM topics
  WHERE name = ?
  ORDER BY name ASC;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM topics;
  ''';

  static const DELETE = '''
  DELETE FROM topics
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM topics
  ORDER BY name ASC;
  ''';

  static const GET = '''
  SELECT * FROM topics
  WHERE id = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM topics
  WHERE name = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM topics;
  ''';

  FutureOr<List<Topic>> search(String query);

  FutureOr<List<Topic>> getTopicsForHymn(int hymnId);
}
