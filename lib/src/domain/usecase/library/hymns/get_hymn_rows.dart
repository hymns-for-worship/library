import '../../../../data/source/database/database.dart';

class GetHymnRows {
  final HfwDatabase db;
  const GetHymnRows(this.db);

  Stream<List<GetHymnRowsResult>> call() async* {
    yield* db.getHymnRows().watch();
  }
}
