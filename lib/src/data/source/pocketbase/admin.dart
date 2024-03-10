import 'package:sqlite_storage/sqlite_storage.dart';

import '../database/connection/connection.dart';
import 'client.dart';

Future<HfwStudio> adminClient({
  String username = 'client@hymnsforworship.app',
  String password = 'hingyv-gYrtaq-hutqe8',
}) async {
  final pb = await HfwStudio.init(DriftStorage(connect('admin.db')));
  await pb.admins.authWithPassword(username, password);
  return pb;
}
