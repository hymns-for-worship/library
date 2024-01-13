import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';

class GetUserTopicLibrary {
  final HfwDatabase db;

  GetUserTopicLibrary(this.db);

  Stream<List<Topic>> call(String user) {
    final library = db.getUserTopicLibrary(user).watch();
    final hymns = db.getTopics().watch();
    return library.combineLatest(hymns, (library, hymns) {
      final results = <Topic>[];
      for (final hymn in hymns) {
        if (library.any((s) => s.topicId == hymn.id)) {
          results.add(hymn);
        }
      }
      return results;
    });
  }
}
