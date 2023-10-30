import '../../data/repository/hymn_stakeholders.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/stakeholders.dart';
import '../model/hymn.dart';
import '../model/stakeholders.dart';

typedef GetStakeholderResult = ({
  Stakeholder? stakeholder,
  List<Hymn> hymns,
});

class GetStakeholder {
  final StakeholdersRepository stakeholders;
  final HymnStakeholdersRepository hymnStakeholders;
  final HymnsRepository hymns;

  GetStakeholder({
    required this.stakeholders,
    required this.hymnStakeholders,
    required this.hymns,
  });

  GetStakeholderResult execute(int id) {
    final stakeholder = stakeholders.getById(id);
    final hymnIds = hymnStakeholders.getHymnIdsForStakeholder(id);
    final hymns = <Hymn>[];
    for (final hymnId in hymnIds) {
      final hymn = this.hymns.getById(hymnId);
      if (hymn != null) hymns.add(hymn);
    }
    return (
      stakeholder: stakeholder,
      hymns: hymns,
    );
  }
}
