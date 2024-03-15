import '../../../../data/source/database/database.dart';

class GetHymns {
  final HfwDatabase db;
  const GetHymns(this.db);

  Stream<List<Hymn>> call() {
    return db.getHymns().watch();
  }
}
