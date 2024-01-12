import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import '../../../../data/utils/retry/future.dart';
import '../../downloads/import_hymn.dart';

class DownloadLibrary {
  final HfwDatabase db;
  final HfwStudio client;
  late final importHymn = ImportHymn(db);

  DownloadLibrary(this.db, this.client);

  Stream<double> call({bool Function()? cancel}) async* {
    yield 0;
    final col = client.collection('bundles');
    var page = 0;
    var pages = 1;
    const perPage = 30;
    while (page < pages) {
      await retryFuture(() async {
        final results = await col.getList(
          page: ++page,
          perPage: perPage,
        );
        pages = results.totalPages;
        for (final item in results.items) {
          final str = item.getStringValue('info');
          if (str.isNotEmpty) {
            await importHymn.importInfo(str);
          }
        }
      });
      yield page / pages;
      if (cancel?.call() ?? false) return;
    }
    yield 1;
  }
}
