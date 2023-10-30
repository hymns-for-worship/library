import '../../data/repository/hymn_hymnals.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/hymnals.dart';
import '../model/hymn.dart';
import '../model/hymnal.dart';

typedef GetHymnalResult = ({
  Hymnal? hymnal,
  List<Hymn> hymns,
});

class GetHymnal {
  final HymnalsRepository hymnals;
  final HymnHymnalsRepository hymnHymnals;
  final HymnsRepository hymns;

  GetHymnal({
    required this.hymnals,
    required this.hymnHymnals,
    required this.hymns,
  });

  GetHymnalResult execute(int id) {
    final hymnal = hymnals.getById(id);
    final hymnIds = hymnHymnals.getHymnIdsForHymnal(id);
    final hymns = <Hymn>[];
    for (final hymnId in hymnIds) {
      final hymn = this.hymns.getById(hymnId);
      if (hymn != null) hymns.add(hymn);
    }
    return (
      hymnal: hymnal,
      hymns: hymns,
    );
  }
}
