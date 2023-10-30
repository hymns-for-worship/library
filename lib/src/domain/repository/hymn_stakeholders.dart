import 'dart:async';

import '../../domain/model/stakeholders.dart';
import '../../domain/repository/base.dart';

typedef HymnStakeholderData = (
  int hymnId,
  int stakeholderId,
  String relationship,
);

abstract class IHymnStakeholdersRepository extends BaseRepository<HymnStakeholder, HymnStakeholderData> {
  IHymnStakeholdersRepository(super.value);

  static const TABLE = 'hymn_stakeholders';

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS $TABLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hymnId INTEGER NOT NULL,
    stakeholderId INTEGER NOT NULL,
    relationship TEXT NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (hymnId, stakeholderId, relationship)
  );
  ''';

  static const TRIGGER_DELETE_HYMN = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_hymn_delete
  AFTER DELETE ON hymns
  BEGIN
    DELETE FROM $TABLE
    WHERE hymnId = OLD.id;
  END;
  ''';

  static const TRIGGER_DELETE_STAKEHOLDER = '''
  CREATE TRIGGER IF NOT EXISTS ${TABLE}_stakeholder_delete
  AFTER DELETE ON stakeholders
  BEGIN
    DELETE FROM $TABLE
    WHERE stakeholderId = OLD.id;
  END;
  ''';

  static const INSERT = '''
  INSERT INTO $TABLE (hymnId, stakeholderId, relationship, lastModified)
  VALUES (?, ?, ?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM $TABLE
  WHERE hymnId = ? AND stakeholderId = ? AND relationship = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM $TABLE
  WHERE hymnId = ? AND stakeholderId = ? AND relationship = ?;
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
  ORDER BY relationship ASC;
  ''';

  static const GET = '''
  SELECT * FROM $TABLE
  WHERE id = ?;
  ''';

  static const GET_HYMN_IDS_FOR_STAKEHOLDER = '''
  SELECT * FROM $TABLE
  WHERE stakeholderId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM $TABLE;
  ''';

  FutureOr<List<int>> getHymnIdsForStakeholder(int stakeholderId);
}
