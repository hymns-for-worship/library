import 'package:sqlite_storage/sqlite_storage.dart';

class GetHymnBundles {
  final DriftStorage storage;

  GetHymnBundles(this.storage);

  Stream<List<Metadata>> call() {
    final dir = storage.io.directory('downloads/bundles');
    return dir.list().watch();
  }
}
