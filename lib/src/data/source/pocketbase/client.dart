import 'package:http/http.dart';
import 'package:sqlite_storage/sqlite_storage.dart';
import 'package:sqlite_storage_pocketbase/sqlite_storage_pocketbase.dart';

class HfwStudio extends OfflinePocketBase {
  HfwStudio({
    super.lang,
    required DriftStorage storage,
    required super.offlineAuthStore,
    super.httpClientFactory,
  }) : super('https://hymnsforworship.studio', storage);

  Future<HfwStudio> init(
    DriftStorage storage, {
    Client Function()? httpClientFactory,
    String lang = "en-US",
  }) async {
    final authStore = await OfflineAuthStore.init(storage);
    return HfwStudio(
      storage: storage,
      lang: lang,
      offlineAuthStore: authStore,
    );
  }
}
