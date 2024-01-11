import '../../../../data/source/database/database.dart';

class DeleteHymnal {
  final HfwDatabase db;

  DeleteHymnal(this.db);

  void call(Hymnal value) async {
    await db.deleteHymnal(value.id);
    final hymns = await db.getHymnsByHymnalId(value.id).get();
    for (final hymn in hymns) {
      await db.deleteHymn(hymn.id);
    }
  }
}
