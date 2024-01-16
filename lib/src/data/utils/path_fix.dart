import 'package:path/path.dart' as path;

String replaceSpecialChars(String str) {
  final exp = RegExp(r'[/\\?%*:|"<>]');
  return str.replaceAll(exp, '_');
}

String fixPath(String str) {
  return path.joinAll(path.split(str).map(replaceSpecialChars).toList());
}
