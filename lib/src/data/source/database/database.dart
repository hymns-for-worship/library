import 'package:archive/archive.dart';
import 'package:drift/drift.dart';

import '../archive/zip.dart';

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
  'sql/hymnals.drift',
  'sql/hymn_hymnals.drift',
  'sql/portions.drift',
  'sql/hymn_portions.drift',
})
class HfwDatabase extends _$HfwDatabase {
  HfwDatabase(super.connection);

  @override
  int get schemaVersion => 1;
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
