import '../../../../data/source/database/database.dart';

typedef GetStakeholderResult = ({
  Stakeholder? stakeholder,
  List<Hymn> hymns,
});

class GetStakeholder {
  final HfwDatabase db;
  const GetStakeholder(this.db);

  Future<GetStakeholderResult> call(String id) async {
    final stakeholder = await db.getStakeholder(id).getSingleOrNull();
    final hymns = await db.getHymnsByStakeholderId(id).get();
    return (
      stakeholder: stakeholder,
      hymns: hymns,
    );
  }
}
