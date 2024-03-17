import '../../../../data/source/database/database.dart';

class GetStakeholders {
  final HfwDatabase db;
  const GetStakeholders(this.db);

  Stream<List<GetStakeholdersResult>> call() async* {
    yield* db.getStakeholders().watch();
  }
}
