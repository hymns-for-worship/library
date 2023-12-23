import '../../data/source/database/database.dart';

class GetHymnals {
  final HfwDatabase db;
  const GetHymnals(this.db);

  Stream<List<Hymnal>> call() async* {
    yield* db.getHymnals().watch();
  }
}
