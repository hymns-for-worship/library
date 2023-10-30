import 'dart:async';

import 'package:hfw_library/hfw_library.dart';
import 'package:sqlite3/sqlite3.dart';

typedef LibraryRepository = ({
  AssetsRepository assetsRepository,
  HymnHymnalsRepository hymnHymnalsRepository,
  HymnPortionsRepository hymnPortionsRepository,
  HymnScripturesRepository hymnScripturesRepository,
  HymnStakeholdersRepository hymnStakeholdersRepository,
  HymnTopicsRepository hymnTopicsRepository,
  HymnalsRepository hymnalsRepository,
  HymnsRepository hymnsRepository,
  PortionsRepository portionsRepository,
  ScripturesRepository scripturesRepository,
  StakeholdersRepository stakeholdersRepository,
  TopicsRepository topicsRepository,
});

FutureOr<LibraryRepository> createLibrary(Database db,
    {bool refresh = true}) async {
  final library = (
    assetsRepository: AssetsRepository(db),
    hymnHymnalsRepository: HymnHymnalsRepository(db),
    hymnPortionsRepository: HymnPortionsRepository(db),
    hymnScripturesRepository: HymnScripturesRepository(db),
    hymnStakeholdersRepository: HymnStakeholdersRepository(db),
    hymnTopicsRepository: HymnTopicsRepository(db),
    hymnalsRepository: HymnalsRepository(db),
    hymnsRepository: HymnsRepository(db),
    portionsRepository: PortionsRepository(db),
    scripturesRepository: ScripturesRepository(db),
    stakeholdersRepository: StakeholdersRepository(db),
    topicsRepository: TopicsRepository(db),
  );
  for (final repo in library.repositories) {
    await repo.createTable();
  }
  for (final repo in library.repositories) {
    await repo.createTriggers();
  }
  if (refresh) {
    for (final repo in library.repositories) {
      await repo.refresh();
    }
  }
  return library;
}

extension LibraryRepositoryUtils on LibraryRepository {
  List<BaseRepository> get repositories => [
        assetsRepository,
        hymnHymnalsRepository,
        hymnPortionsRepository,
        hymnScripturesRepository,
        hymnStakeholdersRepository,
        hymnTopicsRepository,
        hymnalsRepository,
        hymnsRepository,
        portionsRepository,
        scripturesRepository,
        stakeholdersRepository,
        topicsRepository,
      ];
}
