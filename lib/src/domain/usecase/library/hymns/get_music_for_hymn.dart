import '../../../model/bundle_file.dart';
import '../../../model/hymn_archive.dart';

class GetMusicForHymn {
  List<BundleFile> call(HymnArchive archive, [bool large = true]) {
    return archive.getMusic(large);
  }
}

extension GetMusicForHymnX on HymnArchive {
  List<BundleFile> getMusic(bool large) {
    final results = findFiles((e) =>
        e.name.contains('PresentationCreator/assets') &&
        e.name.contains('- Print ${large ? 'Large' : 'Small'}') &&
        e.name.endsWith('.png'));
    results.sort((a, b) => a.path.compareTo(b.path));
    return results;
  }
}
