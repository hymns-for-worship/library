import 'dart:typed_data';

import 'package:archive/archive.dart';

Archive _extractZip(Uint8List bytes) {
  final decoder = ZipDecoder();
  return decoder.decodeBytes(bytes);
}

Archive extractZipSync(Uint8List bytes) {
  return _extractZip(bytes);
}

Future<Archive> extractZipAsync(Uint8List bytes) async {
  return _extractZip(bytes);
}
