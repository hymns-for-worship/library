import '../../../../data/source/database/database.dart';
import '../../../model/bundle_file.dart';
import '../../../model/hymn_archive.dart';

class GetSlidesForHymn {
  final HfwDatabase db;

  GetSlidesForHymn(this.db);

  Stream<Map<String, List<BundleFile>>?> call(
    String hymnId,
    HymnArchive archive,
  ) async* {
    final portions = await db //
        .getPortionsByHymnId(hymnId)
        .get();

    final slides = <String, List<BundleFile>>{};

    final names = portions.map((e) => e.name).toSet();

    final title = archive.getTitle();
    slides['Title'] = [if (title != null) title];

    final verses = names.where((e) => e.startsWith('Verse')).toList();
    names.removeWhere((e) => e.startsWith('Verse'));

    for (final verse in verses) {
      final verseNum = int.parse(verse.split(' ')[1]);
      slides[verse] = archive.getVerse(verseNum);
    }

    for (final part in names) {
      slides[part] = archive.findFiles(
        (e) =>
            e.name.contains('- ${part.toUpperCase()}.') &&
            e.name.endsWith('.png'),
      );
    }

    yield slides;
  }
}

extension GetSlidesForHymnX on HymnArchive {
  BundleFile? getTitle() => findFile((e) => e.name.endsWith('- TITLE.png'));

  List<BundleFile> getVerse(int verse) {
    return findFiles((e) {
      return e.name.contains('- VERSE $verse.') && e.name.endsWith('.png');
    });
  }
}
