import '../../../../data/source/database/database.dart';

class GetTopics {
  final HfwDatabase db;
  const GetTopics(this.db);

  Stream<List<GetTopicsResult>> call() async* {
    yield* db.getTopics().watch();
  }
}
