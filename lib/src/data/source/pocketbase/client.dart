import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_store.dart';

class HfwStudio extends PocketBase {
  final SharedPreferences prefs;

  HfwStudio(
    this.prefs, {
    String url = 'https://hymnsforworship.studio',
    super.httpClientFactory,
    super.lang,
    String authKey = 'app-user-data',
  }) : super(url,
            authStore: HfwAuthStore(
              prefs,
              authKey: authKey,
            ));

  HfwAuthStore get asyncAuthStore => authStore as HfwAuthStore;
}
