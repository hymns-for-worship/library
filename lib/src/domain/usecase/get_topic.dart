import '../../data/repository/hymn_topics.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/topics.dart';
import '../model/hymn.dart';
import '../model/topics.dart';

typedef GetTopicResult = ({
  Topic? topic,
  List<Hymn> hymns,
});

class GetTopic {
  final TopicsRepository topics;
  final HymnTopicsRepository hymnTopics;
  final HymnsRepository hymns;

  GetTopic({
    required this.topics,
    required this.hymnTopics,
    required this.hymns,
  });

  GetTopicResult execute(int id) {
    final topic = topics.getById(id);
    final hymnIds = hymnTopics.getHymnIdsForTopic(id);
    final hymns = <Hymn>[];
    for (final hymnId in hymnIds) {
      final hymn = this.hymns.getById(hymnId);
      if (hymn != null) hymns.add(hymn);
    }
    return (
      topic: topic,
      hymns: hymns,
    );
  }
}
