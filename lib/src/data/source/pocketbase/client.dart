import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_store.dart';

class HfwStudio extends PocketBase {
  HfwStudio(
    SharedPreferences prefs, {
    String url = 'https://hymnsforworship.studio',
    super.httpClientFactory,
    super.lang,
    String authKey = 'app-user-data',
  }) : super(url,
            authStore: HfwAuthStore(
              prefs,
              authKey: authKey,
            ));

  HfwStudio.admin({
    String url = 'https://hymnsforworship.studio',
    super.httpClientFactory,
    super.lang,
    String authKey = 'app-user-data',
  }) : super(url);

  HfwAuthStore get asyncAuthStore => authStore as HfwAuthStore;
}
