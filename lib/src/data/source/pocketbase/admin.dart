import 'package:pocketbase/pocketbase.dart';

Future<PocketBase> adminClient({
  String username = 'client@hymnsforworship.app',
  String password = 'hingyv-gYrtaq-hutqe8',
}) async {
  final pb = PocketBase('https://hymnsforworship.studio');
  await pb.admins.authWithPassword(username, password);
  return pb;
}
