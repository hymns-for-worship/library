import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';

class GetUserStakeholderLibrary {
  final HfwDatabase db;

  GetUserStakeholderLibrary(this.db);

  Stream<List<GetStakeholdersResult>> call(String user) {
    final library = db.getUserStakeholderLibrary(user).watch();
    final items = db.getStakeholders().watch();
    return library.combineLatest(items, (library, items) {
      final results = <GetStakeholdersResult>[];
      for (final item in items) {
        if (library.any((s) => s.stakeholderId == item.stakeholder.id)) {
          results.add(item);
        }
      }
      return results;
    });
  }
}
