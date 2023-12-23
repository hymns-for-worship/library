import '../../data/source/database/database.dart';
import '../model/hymn_archive.dart';
import 'get_hymn_archive.dart';

typedef GetHymnResult = ({
  Hymn? hymn,
  Hymnal? hymnal,
  List<Topic> topics,
  List<Scripture> scriptures,
  List<Portion> portions,
  List<GetStakeholdersWithRelationshipForHymnIdResult> stakeholders,
  HymnArchive? archive,
});

class GetHymn {
  final HfwDatabase db;
  final GetHymnArchive getHymnArchive;

  const GetHymn({
    required this.db,
    required this.getHymnArchive,
  });

  Future<GetHymnResult> call(String id) async {
    final hymn = await db //
        .getHymn(id)
        .getSingleOrNull();
    final hymnal = await db //
        .getHymnalByHymnId(id)
        .getSingleOrNull();
    final topics = await db //
        .getTopicsByHymnId(id)
        .get();
    final scriptures = await db //
        .getScripturesByHymnId(id)
        .get();
    final portions = await db //
        .getPortionsByHymnId(id)
        .get();
    final stakeholders = await db //
        .getStakeholdersWithRelationshipForHymnId(id)
        .get();
    final archive = await getHymnArchive(id).first;
    return (
      hymn: hymn,
      hymnal: hymnal,
      topics: topics,
      scriptures: scriptures,
      portions: portions,
      stakeholders: stakeholders,
      archive: archive,
    );
  }
}
