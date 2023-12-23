import '../../../model/bundle_file.dart';
import '../../../model/hymn_archive.dart';
import 'get_hymn_archive.dart';

class GetTitleForHymn {
  final GetHymnArchive getHymnArchive;

  GetTitleForHymn({
    required this.getHymnArchive,
  });

  Stream<BundleFile?> call(String hymnId) async* {
    await for (final archive in getHymnArchive(hymnId)) {
      if (archive == null) {
        yield null;
        return;
      }
      yield archive.getTitle();
    }
  }
}

extension GetTitleForHymnX on HymnArchive {
  BundleFile? getTitle() => findFile((e) => e.name.endsWith('TITLE.png'));
}
