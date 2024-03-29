import '../../../../data/source/database/database.dart';

class GetUserLibrary {
  final HfwDatabase db;

  GetUserLibrary(this.db);

  Stream<List<UserLibraryData>> call(String user) {
    return db
        .getUserLibrary(user)
        .watch()
        .map((items) => items.where((e) => e.deleted != true).toList());
  }
}
