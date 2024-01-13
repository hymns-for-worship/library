import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';

class GetUserHymnLibrary {
  final HfwDatabase db;

  GetUserHymnLibrary(this.db);

  Stream<List<Hymn>> call(String user) {
    final library = db.getUserHymnLibrary(user).watch();
    final hymns = db.getHymns().watch();
    return library.combineLatest(hymns, (library, hymns) {
      final results = <Hymn>[];
      for (final hymn in hymns) {
        if (library.any((e) => e.hymnId == hymn.id)) {
          results.add(hymn);
        }
      }
      return results;
    });
  }
}
