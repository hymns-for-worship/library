import '../../../model/bundle_file.dart';
import '../../../model/hymn_archive.dart';
import 'get_hymn_archive.dart';

class GetMusicForHymn {
  final GetHymnArchive getHymnArchive;

  GetMusicForHymn({
    required this.getHymnArchive,
  });

  Stream<List<BundleFile>> call(String hymnId) async* {
    await for (final archive in getHymnArchive(hymnId)) {
      if (archive == null) {
        yield [];
        return;
      }
      yield archive.getMusic();
    }
  }
}

extension GetMusicForHymnX on HymnArchive {
  List<BundleFile> getMusic() {
    final results = findFiles((e) =>
        e.name.contains('PresentationCreator/assets') &&
        e.name.contains('- Print Large') &&
        e.name.endsWith('.png'));
    results.sort((a, b) => a.path.compareTo(b.path));
    return results;
  }
}
