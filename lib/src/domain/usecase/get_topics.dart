import '../../data/repository/topics.dart';
import '../model/topics.dart';

class GetTopics {
  final TopicsRepository topics;

  GetTopics({
    required this.topics,
  });

  List<Topic> execute() {
    return topics.getAll();
  }
}
