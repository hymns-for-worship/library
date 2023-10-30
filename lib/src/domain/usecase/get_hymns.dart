import '../../data/repository/hymnals.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/portions.dart';
import '../../data/repository/scriptures.dart';
import '../../data/repository/topics.dart';
import '../model/hymn.dart';
import '../model/hymnal.dart';
import '../model/portion.dart';
import '../model/scriptures.dart';
import '../model/topics.dart';

typedef GetHymnsResult = (
  Hymn,
  Hymnal?,
  List<Topic>,
  List<Scripture>,
  List<Portion>,
);

class GetHymns {
  final TopicsRepository topics;
  final ScripturesRepository scriptures;
  final HymnsRepository hymns;
  final HymnalsRepository hymnals;
  final PortionsRepository portions;

  GetHymns({
    required this.topics,
    required this.scriptures,
    required this.hymns,
    required this.hymnals,
    required this.portions,
  });

  List<GetHymnsResult> execute([String query = '']) {
    final q = query.trim();
    final hymns = q.isNotEmpty ? this.hymns.search(q) : this.hymns.getAll();
    final results = <GetHymnsResult>[];
    for (final hymn in hymns) {
      final hymnal = hymnals.getHymnalForHymn(hymn.id);
      final topics = this.topics.getTopicsForHymn(hymn.id);
      final scriptures = this.scriptures.getScripturesForHymn(hymn.id);
      final portions = this.portions.getPortionsForHymn(hymn.id);
      results.add((
        hymn,
        hymnal,
        topics,
        scriptures,
        portions,
      ));
    }
    return results;
  }
}
