import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';

class GetUserStakeholderLibrary {
  final HfwDatabase db;

  GetUserStakeholderLibrary(this.db);

  Stream<List<Stakeholder>> call(String user) {
    final library = db.getUserStakeholderLibrary(user).watch();
    final hymns = db.getStakeholders().watch();
    return library.combineLatest(hymns, (library, hymns) {
      final results = <Stakeholder>[];
      for (final hymn in hymns) {
        if (library.any((s) => s.stakeholderId == hymn.id)) {
          results.add(hymn);
        }
      }
      return results;
    });
  }
}
