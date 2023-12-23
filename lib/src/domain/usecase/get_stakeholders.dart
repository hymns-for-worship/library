import '../../data/source/database/database.dart';

class GetStakeholders {
  final HfwDatabase db;
  const GetStakeholders(this.db);

  Stream<List<Stakeholder>> call() async* {
    yield* db.getStakeholders().watch();
  }
}
