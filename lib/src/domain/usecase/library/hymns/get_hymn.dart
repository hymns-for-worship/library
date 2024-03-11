import 'package:hfw_core/hfw_core.dart';
import 'package:stream_transform/stream_transform.dart';

typedef GetHymnResult = ({
  Hymn? hymn,
  Hymnal? hymnal,
  List<Topic> topics,
  List<Scripture> scriptures,
  List<Portion> portions,
  List<GetStakeholdersWithRelationshipForHymnIdResult> stakeholders,
  Category? category,
  HymnArchive? archive,
});

class GetHymn {
  final HfwDatabase db;

  GetHymn(this.db);

  Stream<GetHymnResult> call(String id) async* {
    // final hymn = db //
    //     .getHymn(id)
    //     .watchSingleOrNull();
    final hymn = db.storage.docs
        .collection('hymns')
        .doc(id)
        .watch()
        .map((e) => Hymn.fromJson(e?.data ?? {}));
    final hymnal = db //
        .getHymnalByHymnId(id)
        .watchSingleOrNull();
    final topics = db //
        .getTopicsByHymnId(id)
        .watch();
    final scriptures = db //
        .getScripturesByHymnId(id)
        .watch();
    final portions = db //
        .getPortionsByHymnId(id)
        .watch();
    final stakeholders = db //
        .getStakeholdersWithRelationshipForHymnId(id)
        .watch();
    final category = db //
        .getCategoriesByHymnId(id)
        .watchSingleOrNull();
    final bundle = db.getBundlesByHymnId(id).watchSingleOrNull();
    // Combine streams of different types
    final first = hymn.cast<Object?>();
    final others = [
      hymnal,
      topics,
      scriptures,
      portions,
      stakeholders,
      category,
      bundle,
    ];
    final latest = first.combineLatestAll(others);
    // Return as object
    await for (final stream in latest) {
      final hymn = stream[0] as Hymn?;
      final hymnal = stream[1] as Hymnal?;
      final topics = stream[2] as List<Topic>;
      final scriptures = stream[3] as List<Scripture>;
      final portions = stream[4] as List<Portion>;
      final stakeholders =
          stream[5] as List<GetStakeholdersWithRelationshipForHymnIdResult>;
      final category = stream[6] as Category?;
      final bundle = stream[7] as Bundle?;
      final archive = await bundle?.toArchiveAsync().then((value) =>
          value == null ? null : HymnArchive(archive: value, hymnId: id));
      yield (
        hymn: hymn,
        hymnal: hymnal,
        topics: topics,
        scriptures: scriptures,
        portions: portions,
        stakeholders: stakeholders,
        archive: archive,
        category: category,
      );
    }
  }
}
