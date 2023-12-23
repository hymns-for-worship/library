import '../../data/source/database/database.dart';

class GetHymnBundles {
  final HfwDatabase db;

  GetHymnBundles(this.db);

  Stream<List<GetBundlesHashesResult>> call() async* {
    final stream = db.getBundlesHashes().watch();
    await for (final result in stream) {
      yield result;
    }
  }
}
