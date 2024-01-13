import '../../../../data/source/database/database.dart';

class GetUserHymnLibrary {
  final HfwDatabase db;

  GetUserHymnLibrary(this.db);

  Stream<List<Hymn>> call(String user) {
    return db.getUserHymnLibrary(user).watch();
  }
}
