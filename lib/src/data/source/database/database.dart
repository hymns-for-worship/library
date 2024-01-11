import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/json1.dart';

import '../archive/zip.dart';
export 'extension.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  'sql/records.drift',
  'sql/bundles.drift',
  'sql/hymns.drift',
  'sql/topics.drift',
  'sql/hymn_topics.drift',
  'sql/stakeholders.drift',
  'sql/hymn_stakeholders.drift',
  'sql/scriptures.drift',
  'sql/hymn_scriptures.drift',
  'sql/categories.drift',
  'sql/hymn_categories.drift',
  'sql/hymnals.drift',
  'sql/hymn_hymnals.drift',
  'sql/portions.drift',
  'sql/hymn_portions.drift',
  'sql/playlists.drift',
  'sql/playlist_items.drift',
  'sql/user_library.drift',
  'sql/user_purchases.drift',
  'sql/analytics.drift',
  'sql/offline_queue.drift',
  'sql/request_cache.drift',
  'sql/users.drift',
})
class HfwDatabase extends _$HfwDatabase {
  HfwDatabase(super.connection);

  @override
  int get schemaVersion => 1;

  Selectable<Record> getRecordsWithFilter(
    String collectionName,
    Map<String, String> filters,
  ) {
    final query = records.select();
    query.where((tbl) => tbl.collectionName.equals(collectionName));
    for (final filter in filters.entries) {
      query.where(
        (tbl) => tbl.data.jsonExtract('\$.${filter.key}').equals(filter.value),
      );
    }
    return query;
  }

  Future<String> insertOrUpdateHymn(HymnsCompanion companion) async {
    final current = await getHymn(companion.id.value).getSingleOrNull();
    if (current == null) {
      await into(hymns).insert(companion);
    } else {
      await update(hymns).replace(companion);
    }
    return companion.id.value;
  }
}

extension BundleUtils on Bundle {
  Archive? toArchive() {
    if (bytes == null) return null;
    return extractZip(bytes!);
  }

  Future<Archive?> toArchiveAsync() async {
    if (bytes == null) return null;
    return extractZipAsync(bytes!);
  }
}
