import '../../../../data/source/database/database.dart';

class GetTopicsWithHymnId {
  final HfwDatabase db;
  const GetTopicsWithHymnId(this.db);

  Stream<List<GetTopicsWithHymnIdResult>> call() async* {
    yield* db.getTopicsWithHymnId().watch();
  }
}
