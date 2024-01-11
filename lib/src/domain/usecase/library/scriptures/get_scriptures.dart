import '../../../../data/source/database/database.dart';

class GetScriptures {
  final HfwDatabase db;
  const GetScriptures(this.db);

  Stream<List<GetScripturesWithHymnIdResult>> call() async* {
    yield* db.getScripturesWithHymnId().watch();
  }
}
