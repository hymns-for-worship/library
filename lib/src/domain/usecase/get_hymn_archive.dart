import '../../data/source/database/database.dart';
import '../model/hymn_archive.dart';

class GetHymnArchive {
  final HfwDatabase db;

  GetHymnArchive(this.db);

  final _cache = <String, WeakReference<HymnArchive>>{};

  Stream<HymnArchive?> call(String hymnId) async* {
    final cached = _cache[hymnId];
    if (cached?.target != null) {
      yield cached!.target!;
      return;
    }
    final stream = db.getBundlesByHymnId(hymnId).watchSingleOrNull();
    await for (final bundle in stream) {
      if (bundle == null) {
        yield null;
        return;
      }
      final archive = await bundle.toArchiveAsync();
      if (archive == null) {
        yield null;
        return;
      }
      final hymnArchive = HymnArchive(archive: archive, hymnId: hymnId);
      _cache[hymnId] = WeakReference(hymnArchive);
      yield hymnArchive;
    }
  }
}
