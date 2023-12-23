import '../../../../data/source/database/database.dart';

typedef GetHymnalResult = ({
  Hymnal? hymnal,
  List<Hymn> hymns,
});

class GetHymnal {
  final HfwDatabase db;
  const GetHymnal(this.db);

  Future<GetHymnalResult> call(String id) async {
    final hymnal = await db //
        .getHymnal(id)
        .getSingleOrNull();
    final hymns = await db //
        .getHymnsByHymnalId(id)
        .get();
    return (
      hymnal: hymnal,
      hymns: hymns,
    );
  }
}
