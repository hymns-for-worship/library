import '../../../../data/source/database/database.dart';

class GetUserStakeholderLibrary {
  final HfwDatabase db;

  GetUserStakeholderLibrary(this.db);

  Stream<List<Stakeholder>> call(String user) {
    return db.getUserStakeholderLibrary(user).watch();
  }
}
