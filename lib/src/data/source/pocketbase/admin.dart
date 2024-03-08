import 'client.dart';

Future<HfwStudio> adminClient({
  String username = 'client@hymnsforworship.app',
  String password = 'hingyv-gYrtaq-hutqe8',
}) async {
  final pb = HfwStudio.admin();
  await pb.admins.authWithPassword(username, password);
  return pb;
}
