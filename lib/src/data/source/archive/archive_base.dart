import 'dart:typed_data';

import 'create_zip.dart';

typedef FileData = (String, Uint8List);

class ArchiveBase {
  ArchiveBase(this.files);

  final Map<String, Uint8List> files;

  FileData? find(bool Function(String) predicate) {
    for (final file in files.entries) {
      if (predicate(file.key)) {
        return (file.key, file.value);
      }
    }
    return null;
  }

  List<FileData> filter(bool Function(String) predicate) {
    final result = <FileData>[];
    for (final file in files.entries) {
      if (predicate(file.key)) {
        result.add((file.key, file.value));
      }
    }
    return result;
  }

  FileData? get(String path) {
    for (final file in files.entries) {
      if (file.key == path) {
        return (file.key, file.value);
      }
    }
    return null;
  }

  Uint8List? read(String path) {
    final file = get(path);
    if (file != null) {
      return file.$2;
    }
    return null;
  }

  void write(String path, List<int> bytes) {
    if (get(path) != null) remove(path);
    files[path] = Uint8List.fromList(bytes);
  }

  void remove(String path) {
    final file = get(path);
    if (file != null) {
      files.remove(file.$1);
    }
  }

  void removeAll(List<String> paths) {
    for (final path in paths) {
      remove(path);
    }
  }

  List<int>? toBytes() => createZip(files);
}
