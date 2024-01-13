import '../../../../data/source/database/database.dart';

class GetUserTopicLibrary {
  final HfwDatabase db;

  GetUserTopicLibrary(this.db);

  Stream<List<Topic>> call(String user) {
    return db.getUserTopicLibrary(user).watch();
  }
}
