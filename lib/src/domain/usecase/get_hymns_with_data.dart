import '../../data/source/database/database.dart';

class GetHymnsWithData {
  final HfwDatabase db;
  const GetHymnsWithData(this.db);

  Future<List<GetHymnRowsResult>> call() async {
    return db.getHymnRows().get();
  }

  Future<List<SearchHymnRowsResult>> search(String query) async {
    final q = query.trim();
    return db.searchHymnRows(q).get();
  }
}
