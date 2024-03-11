import '../../../../data/source/database/database.dart';

class GetHymns {
  final HfwDatabase db;
  const GetHymns(this.db);

  Stream<List<Hymn>> call() {
    // yield* db.getHymns().watch();
    return db.storage.docs
        .collection('hymns')
        .watchAll()
        .map((items) => items.map((e) => Hymn.fromJson(e.data ?? {})).toList());
  }
}
