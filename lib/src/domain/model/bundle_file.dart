import 'dart:typed_data';

class BundleFile {
  final String? hymnId;
  final String path;
  final Uint8List data;

  BundleFile({
    required this.path,
    required this.data,
    this.hymnId,
  });
}
