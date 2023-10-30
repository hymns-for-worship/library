import '../../data/repository/stakeholders.dart';
import '../model/stakeholders.dart';

class GetStakeholders {
  final StakeholdersRepository stakeholders;

  GetStakeholders({
    required this.stakeholders,
  });

  List<Stakeholder> execute() {
    return stakeholders.getAll();
  }
}
