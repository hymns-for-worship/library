import 'dart:async';

import '../../domain/model/topics.dart';
import '../../domain/repository/base.dart';

typedef HymnTopicData = (int hymnId, int topicId);

abstract class IHymnTopicsRepository extends BaseRepository<HymnTopic, HymnTopicData> {
  IHymnTopicsRepository(super.value);

  static const TABLE = 'hymn_topics';

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hymnId INTEGER NOT NULL,
    topicId INTEGER NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnId, topicId)
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

  static const TRIGGER_TOPIC_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_topic_delete
  AFTER DELETE ON topics
  BEGIN
    DELETE FROM $TABLE
    WHERE topicId = OLD.id;
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

  static const GET_HYMN_IDS_FOR_TOPIC = '''
  SELECT * FROM $TABLE
  WHERE topicId = ?;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, topicId, lastModified)
  VALUES (?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND topicId = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND topicId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  FutureOr<List<int>> getHymnIdsForTopic(int topicId);
}
