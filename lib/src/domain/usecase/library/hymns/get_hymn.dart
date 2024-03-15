import 'package:archive/archive.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:sqlite_storage/sqlite_storage.dart';
import 'package:stream_transform/stream_transform.dart';

typedef GetHymnResult = ({
  Hymn? hymn,
  Hymnal? hymnal,
  List<Topic> topics,
  List<Scripture> scriptures,
  List<Portion> portions,
  List<Link> links,
  List<GetStakeholdersWithRelationshipForHymnIdResult> stakeholders,
  Category? category,
  HymnArchive? archive,
});

class GetHymn {
  final HfwDatabase db;
  final DriftStorage storage;

  GetHymn(this.db, this.storage);

  Stream<GetHymnResult> call(String id) async* {
    final hymn = db //
        .getHymn(id)
        .watchSingleOrNull();
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
    final links = db //
        .getLinkByHymn(id)
        .watch();
    final category = db //
        .getCategoriesByHymnId(id)
        .watchSingleOrNull();
    final file = storage.io.file('downloads/bundles/$id.zip');
    final bundle = file
        .watchAsBytes()
        .map((bytes) =>
            bytes == null ? null : (bytes, ZipDecoder().decodeBytes(bytes)))
        .map((archive) => archive == null
            ? null
            : HymnArchive(
                archive: archive.$2,
                bytes: archive.$1,
                hymnId: id,
              ));
    // Combine streams of different types
    final first = hymn.cast<Object?>();
    final others = [
      hymnal,
      topics,
      scriptures,
      portions,
      stakeholders,
      category,
      links,
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
      final links = stream[7] as List<Link>;
      final archive = stream[8] as HymnArchive?;
      yield (
        hymn: hymn,
        hymnal: hymnal,
        topics: topics,
        scriptures: scriptures,
        portions: portions,
        stakeholders: stakeholders,
        archive: archive,
        category: category,
        links: links,
      );
    }
  }
}

Stream<List<Object?>> combineAll(List<Stream<Object?>> streams) {
  if (streams.isEmpty) return const Stream.empty();
  if (streams.length == 1) {
    return streams.first.map((e) => [e]);
  }
  final [first, ...rest] = streams;
  return first.combineLatestAll(rest);
}
