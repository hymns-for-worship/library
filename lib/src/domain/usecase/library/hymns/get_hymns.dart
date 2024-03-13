import 'package:hfw_core/hfw_core.dart';

class GetHymns {
  final HfwDatabase db;
  final HymnalVersions versions;
  const GetHymns(this.db, this.versions);

  Stream<List<Hymn>> call() {
    // yield* db.getHymns().watch();
    return db.storage.docs
        .collection('hymns')
        .watchAll()
        .map((items) => items.map((e) => Hymn.fromJson(e.data ?? {})).toList());
  }
}
