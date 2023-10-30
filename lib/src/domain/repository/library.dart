import 'assets.dart';
import 'hymn_hymnals.dart';
import 'hymn_portions.dart';
import 'hymn_scriptures.dart';
import 'hymn_stakeholders.dart';
import 'hymn_topics.dart';
import 'hymnals.dart';
import 'hymns.dart';
import 'portions.dart';
import 'scriptures.dart';
import 'stakeholders.dart';
import 'topics.dart';

typedef ILibraryRepository = ({
  IAssetsRepository assetsRepository,
  IHymnHymnalsRepository hymnHymnalsRepository,
  IHymnPortionsRepository hymnPortionsRepository,
  IHymnScripturesRepository hymnScripturesRepository,
  IHymnStakeholdersRepository hymnStakeholdersRepository,
  IHymnTopicsRepository hymnTopicsRepository,
  IHymnalsRepository hymnalsRepository,
  IHymnsRepository hymnsRepository,
  IPortionsRepository portionsRepository,
  IScripturesRepository scripturesRepository,
  IStakeholdersRepository stakeholdersRepository,
  ITopicsRepository topicsRepository,
});
