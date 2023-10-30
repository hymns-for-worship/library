import '../../data/repository/hymnals.dart';
import '../model/hymnal.dart';

class GetHymnals {
  final HymnalsRepository hymnals;

  GetHymnals({
    required this.hymnals,
  });

  List<Hymnal> execute() {
    return hymnals.getAll();
  }
}
