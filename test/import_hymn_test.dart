import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  TopicsRepository topics = TopicsRepository(db);
  HymnTopicsRepository hymnTopics = HymnTopicsRepository(db);
  ScripturesRepository scriptures = ScripturesRepository(db);
  HymnScripturesRepository hymnScriptures = HymnScripturesRepository(db);
  HymnsRepository hymns = HymnsRepository(db);
  HymnalsRepository hymnals = HymnalsRepository(db);
  HymnHymnalsRepository hymnHymnals = HymnHymnalsRepository(db);
  PortionsRepository portions = PortionsRepository(db);
  StakeholdersRepository stakeholders = StakeholdersRepository(db);
  HymnStakeholdersRepository hymnStakeholders = HymnStakeholdersRepository(db);
  HymnPortionsRepository hymnPortions = HymnPortionsRepository(db);
  AssetsRepository assets = AssetsRepository(db);

  ImportHymn usecase = ImportHymn(
    topics: topics,
    hymnTopics: hymnTopics,
    hymnHymnals: hymnHymnals,
    hymnStakeholders: hymnStakeholders,
    hymnScriptures: hymnScriptures,
    hymns: hymns,
    hymnals: hymnals,
    hymnPortions: hymnPortions,
    scriptures: scriptures,
    portions: portions,
    stakeholders: stakeholders,
    assets: assets,
  );

  group('import hymn test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      topics = TopicsRepository(db);
      hymnTopics = HymnTopicsRepository(db);
      scriptures = ScripturesRepository(db);
      hymnScriptures = HymnScripturesRepository(db);
      hymns = HymnsRepository(db);
      hymnals = HymnalsRepository(db);
      hymnHymnals = HymnHymnalsRepository(db);
      hymnPortions = HymnPortionsRepository(db);
      portions = PortionsRepository(db);
      stakeholders = StakeholdersRepository(db);
      hymnStakeholders = HymnStakeholdersRepository(db);
      assets = AssetsRepository(db);

      usecase = ImportHymn(
        topics: topics,
        hymnTopics: hymnTopics,
        hymnHymnals: hymnHymnals,
        hymnStakeholders: hymnStakeholders,
        hymnScriptures: hymnScriptures,
        hymnPortions: hymnPortions,
        hymns: hymns,
        hymnals: hymnals,
        scriptures: scriptures,
        portions: portions,
        stakeholders: stakeholders,
        assets: assets,
      );
    });

    tearDown(() {
      db.dispose();
    });

    for (final file in [
      'test/test_data/rjsec1001.zip',
      'test/test_data/rjsec1002.zip',
      'test/test_data/rjsec1003.zip',
    ]) {
      test('check zip import ($file)', () {
        final hymns1 = hymns.getAll();
        final hymnals1 = hymnals.getAll();
        final topics1 = topics.getAll();
        final scriptures1 = scriptures.getAll();
        final portions1 = portions.getAll();
        final stakeholders1 = stakeholders.getAll();
        final assets1 = assets.getAll();

        expect(hymns1.length, 0);
        expect(hymnals1.length, 0);
        expect(topics1.length, 0);
        expect(scriptures1.length, 0);
        expect(portions1.length, 0);
        expect(stakeholders1.length, 0);
        expect(assets1.length, 0);

        final bytes = File(file).readAsBytesSync();
        final result = usecase.execute(bytes);

        final hymns2 = hymns.getAll();
        final hymnals2 = hymnals.getAll();
        final topics2 = topics.getAll();
        final scriptures2 = scriptures.getAll();
        final portions2 = portions.getAll();
        final stakeholders2 = stakeholders.getAll();
        final assets2 = assets.getAll();

        expect(result != null, true);
        expect(hymns2.isNotEmpty, true);
        expect(hymnals2.isNotEmpty, true);
        expect(topics2.isNotEmpty, true);
        expect(scriptures2.isNotEmpty, true);
        expect(portions2.isNotEmpty, true);
        expect(stakeholders2.isNotEmpty, true);
        expect(assets2.isNotEmpty, true);
      });
    }
  });
}
