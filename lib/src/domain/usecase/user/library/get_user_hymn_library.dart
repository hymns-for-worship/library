import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';

class GetUserHymnLibrary {
  final HfwDatabase db;
  final HfwStudio client;

  GetUserHymnLibrary({
    required this.db,
    required this.client,
  });

  Stream<List<UserHymnLibraryData>> call(String user, [String? uid]) {
    return db.getUserHymnLibrary(user, uid).watch();
  }
}
