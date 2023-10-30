import 'dart:async';

import '../../domain/model/stakeholders.dart';
import '../../domain/repository/base.dart';

typedef StakeholderData = String;

typedef StakeholderWithRelationship = (Stakeholder, String);

abstract class IStakeholdersRepository extends BaseRepository<Stakeholder, StakeholderData> {
  IStakeholdersRepository(super.value);

  static const CREATE = '''
  CREATE TABLE IF NOT EXISTS stakeholders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    lastModified TEXT NOT NULL,
    UNIQUE (name)
  );
  ''';

  static const SEARCH_CREATE = '''
  CREATE VIRTUAL TABLE IF NOT EXISTS stakeholders_fts USING fts5(
    name,
    content='stakeholders',
    content_rowid='id'
  );
  ''';

  static const SEARCH_INSERT = '''
  CREATE TRIGGER IF NOT EXISTS stakeholders_insert
  AFTER INSERT ON stakeholders
  BEGIN
    INSERT INTO stakeholders_fts (rowid, name)
    VALUES (new.id, new.name);
  END;
  ''';

  static const SEARCH_UPDATE = '''
  CREATE TRIGGER IF NOT EXISTS stakeholders_update
  AFTER UPDATE ON stakeholders
  BEGIN
    UPDATE stakeholders_fts
    SET name = new.name
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH_DELETE = '''
  CREATE TRIGGER IF NOT EXISTS stakeholders_delete
  AFTER DELETE ON stakeholders
  BEGIN
    DELETE FROM stakeholders_fts
    WHERE rowid = old.id;
  END;
  ''';

  static const SEARCH = '''
  SELECT
    h.id AS id,
    highlight(stakeholders_fts, 0, '<mark>', '</mark>') AS name,
    h.lastModified AS lastModified
  FROM stakeholders_fts
  INNER JOIN stakeholders h ON stakeholders_fts.rowid = h.id
  WHERE stakeholders_fts MATCH ?
  ORDER BY rank
  ''';

  static const GET_STAKEHOLDERS_FOR_HYMN = '''
  SELECT * FROM stakeholders
  INNER JOIN hymn_stakeholders ON stakeholders.id = hymn_stakeholders.stakeholderId
  WHERE hymn_stakeholders.hymnId = ?
  ORDER BY name ASC;
  ''';

  static const INSERT = '''
  INSERT INTO stakeholders (name, lastModified)
  VALUES (?, ?);
  ''';

  static const FIND = '''
  SELECT * FROM stakeholders
  WHERE name = ?
  ORDER BY name ASC;
  ''';

  static const DELETE_ALL = '''
  DELETE FROM stakeholders;
  ''';

  static const DELETE = '''
  DELETE FROM stakeholders
  WHERE id = ?;
  ''';

  static const GET_ALL = '''
  SELECT * FROM stakeholders
  ORDER BY name ASC;
  ''';

  static const GET = '''
  SELECT * FROM stakeholders
  WHERE id = ?;
  ''';

  static const DELETE_FIND = '''
  DELETE FROM stakeholders
  WHERE name = ?;
  ''';

  static const GET_STAKEHOLDERS_WITH_RELATIONSHIP_FOR_HYMN = '''
  SELECT * FROM stakeholders
  INNER JOIN hymn_stakeholders ON stakeholders.id = hymn_stakeholders.stakeholderId
  WHERE hymn_stakeholders.hymnId = ?;
  ''';

  static const COUNT = '''
  SELECT COUNT(*) FROM stakeholders;
  ''';

  FutureOr<List<Stakeholder>> search(String query);

  FutureOr<List<Stakeholder>> getStakeholdersForHymn(int hymnId);

  FutureOr<List<StakeholderWithRelationship>> getStakeholdersWithRelationshipForHymn(int hymnId);
}
