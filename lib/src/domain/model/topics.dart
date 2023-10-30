import 'package:sqlite3/common.dart';

class Topic {
  final int id;
  final String name;

  const Topic({
    required this.id,
    required this.name,
  });

  factory Topic.fromRow(Row row) {
    return Topic(
      id: row['id'] as int,
      name: row['name'] as String,
    );
  }
}

class HymnTopic {
  final int id;
  final int hymnId;
  final int topicId;

  const HymnTopic({
    required this.id,
    required this.hymnId,
    required this.topicId,
  });

  factory HymnTopic.fromRow(Row row) {
    return HymnTopic(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      topicId: row['topicId'] as int,
    );
  }
}
