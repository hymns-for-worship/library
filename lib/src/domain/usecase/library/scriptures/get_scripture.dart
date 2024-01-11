import '../../../../data/source/database/database.dart';

typedef GetScriptureResult = ({
  Scripture? scripture,
  List<Hymn> hymns,
});

class GetScripture {
  final HfwDatabase db;
  const GetScripture(this.db);

  Future<GetScriptureResult> call(String id) async {
    final scripture = await db.getScripture(id).getSingleOrNull();
    final hymns = await db.getHymnsByScriptureId(id).get();
    return (
      scripture: scripture,
      hymns: hymns,
    );
  }
}
