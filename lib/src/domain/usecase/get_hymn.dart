import '../../data/repository/assets.dart';
import '../../data/repository/hymn_stakeholders.dart';
import '../../data/repository/hymnals.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/portions.dart';
import '../../data/repository/scriptures.dart';
import '../../data/repository/stakeholders.dart';
import '../../data/repository/topics.dart';
import '../model/assets.dart';
import '../model/hymn.dart';
import '../model/hymnal.dart';
import '../model/portion.dart';
import '../model/scriptures.dart';
import '../model/stakeholders.dart';
import '../model/topics.dart';
import 'get_hymns.dart';

typedef GetHymnResult = ({
  Hymn? hymn,
  Hymnal? hymnal,
  List<Topic> topics,
  List<Scripture> scriptures,
  List<Portion> portions,
  List<(Stakeholder, String)> stakeholders,
  List<Asset> assets,
});

extension GetHymnResultUtils on GetHymnResult {
  GetHymnsResult? toRow() {
    if (hymn == null) return null;
    return (
      hymn!,
      hymnal,
      topics,
      scriptures,
      portions,
    );
  }
}

class GetHymn {
  final TopicsRepository topics;
  final ScripturesRepository scriptures;
  final HymnsRepository hymns;
  final HymnalsRepository hymnals;
  final PortionsRepository portions;
  final StakeholdersRepository stakeholders;
  final HymnStakeholdersRepository hymnStakeholders;
  final AssetsRepository assets;

  GetHymn({
    required this.topics,
    required this.scriptures,
    required this.hymns,
    required this.hymnals,
    required this.portions,
    required this.stakeholders,
    required this.hymnStakeholders,
    required this.assets,
  });

  GetHymnResult execute(int id) {
    final hymn = hymns.getById(id);
    final topics = this.topics.getTopicsForHymn(id);
    final scriptures = this.scriptures.getScripturesForHymn(id);
    final portions = this.portions.getPortionsForHymn(id);
    final stakeholders = this.stakeholders.getStakeholdersWithRelationshipForHymn(id);
    final hymnal = hymnals.getHymnalForHymn(id);
    final assets = this.assets.getAssetForHymnId(id);
    return (
      hymn: hymn,
      hymnal: hymnal,
      topics: topics,
      scriptures: scriptures,
      portions: portions,
      stakeholders: stakeholders,
      assets: assets,
    );
  }
}
