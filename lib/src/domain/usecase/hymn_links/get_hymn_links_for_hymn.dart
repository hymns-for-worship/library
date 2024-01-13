import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../model/hymn_link.dart';
import 'get_hymn_links.dart';

class GetHymnLinksForHymn {
  final HfwDatabase db;
  final HfwStudio client;

  GetHymnLinksForHymn({required this.db, required this.client});

  late final getLinks = GetHymnLinks(db: db, client: client);

  Stream<List<HymnLink>> call(String hymnId) async* {
    final links = getLinks(null);
    await for (final items in links) {
      yield items.where((e) => e.hymnId == hymnId).toList();
    }
  }
}
