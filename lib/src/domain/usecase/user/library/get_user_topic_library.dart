import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';

class GetUserTopicLibrary {
  final HfwDatabase db;

  GetUserTopicLibrary(this.db);

  Stream<List<GetTopicsResult>> call(String user) {
    final library = db.getUserTopicLibrary(user).watch();
    final items = db.getTopics().watch();
    return library.combineLatest(items, (library, items) {
      final results = <GetTopicsResult>[];
      for (final item in items) {
        if (library.any((s) => s.topicId == item.topic.id)) {
          results.add(item);
        }
      }
      return results;
    });
  }
}
