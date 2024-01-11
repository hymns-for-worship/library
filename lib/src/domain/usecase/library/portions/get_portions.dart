import '../../../../data/source/database/database.dart';

class GetPortions {
  final HfwDatabase db;
  const GetPortions(this.db);

  Stream<List<GetPortionsWithHymnIdResult>> call() async* {
    yield* db.getPortionsWithHymnId().watch();
  }
}
