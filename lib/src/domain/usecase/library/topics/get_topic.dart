import '../../../../data/source/database/database.dart';

typedef GetTopicResult = ({
  Topic? topic,
  List<Hymn> hymns,
});

class GetTopic {
  final HfwDatabase db;
  const GetTopic(this.db);

  Future<GetTopicResult> call(String id) async {
    final topic = await db.getTopic(id).getSingleOrNull();
    final hymns = await db.getHymnsByTopicId(id).get();
    return (
      topic: topic,
      hymns: hymns,
    );
  }
}
