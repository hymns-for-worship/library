import '../../../model/bundle_file.dart';
import '../../../model/hymn_archive.dart';

class GetMusicForHymn {
  List<BundleFile> call(HymnArchive archive) {
    return archive.getMusic();
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
