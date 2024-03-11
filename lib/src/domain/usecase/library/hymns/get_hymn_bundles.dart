import 'package:sqlite_storage/sqlite_storage.dart';

import '../../../../data/source/database/database.dart';

class GetHymnBundles {
  final HfwDatabase db;

  GetHymnBundles(this.db);

  Stream<List<(String, FileData)>> call() async* {
    // final stream = db.getBundlesHashes().watch();
    // await for (final result in stream) {
    //   yield result;
    // }
    yield* db //
        .storage
        .io
        .directory('downloads/bundles')
        .list()
        .watch()
        .map((items) => items
            .map((e) => (e.path.split('/').last.replaceAll('.zip', ''), e))
            .toList());
  }
}
