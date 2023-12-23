import 'package:get_it/get_it.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

final $ = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  final db = HfwDatabase(connectDb('hfw.library.db', delete: false));
  $.registerSingleton<HfwDatabase>(db);

  // void attach<T>(Stream<List<T>> stream) {
  //   $.registerSingleton<ListSignal<T>>(listSignal<T>([]));
  //   connect($.get<ListSignal<T>>()) << stream;
  // }

  // attach<Topic>(GetTopics(db).call());
  // attach<Hymnal>(GetHymnals(db).call());
  // attach<Hymn>(GetHymns(db).call());
  // attach<Stakeholder>(GetStakeholders(db).call());
  $.registerSingleton<GetHymnArchive>(GetHymnArchive(db));
  $.registerSingleton<ImportHymn>(ImportHymn(db));
  $.registerSingleton<SharedPreferences>(prefs);
  $.registerSingleton<HfwStudio>(HfwStudio(prefs));

  final client = $.get<HfwStudio>();

  await client.admins.authWithPassword(
    POCKETBASE_APP_KEY,
    POCKETBASE_APP_SECRET,
  );
}
