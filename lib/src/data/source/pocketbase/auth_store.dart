import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HfwAuthStore extends AsyncAuthStore {
  final SharedPreferences prefs;
  final String authKey;

  HfwAuthStore(
    this.prefs, {
    this.authKey = 'pb_auth',
  }) : super(
          save: (data) async => prefs.setString(authKey, data),
          initial: prefs.getString(authKey),
          clear: () => prefs.remove(authKey),
        );
}
