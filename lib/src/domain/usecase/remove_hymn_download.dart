import 'dart:async';

import '../../data/source/database/database.dart';

class RemoveHymnDownload {
  final HfwDatabase db;

  RemoveHymnDownload(this.db);

  Future<void> call(String hymnId) async {
    // Check for existing download
    final bundle = await db.getBundlesByHymnId(hymnId).getSingleOrNull();
    if (bundle == null) return;
    await db.deleteBundle(bundle.id);
  }
}
