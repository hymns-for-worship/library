import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file/file.dart';

import 'zip_file_encoder.dart';

class OutputFileStream extends OutputStreamBase {
  String path;
  final int byteOrder;
  int _length;
  late RandomAccessFile _fp;
  final Uint8List _buffer;
  int _bufferPosition;
  bool _isOpen;

  OutputFileStream(this.path, {this.byteOrder = LITTLE_ENDIAN, int? bufferSize})
      : _length = 0,
        _buffer = Uint8List(bufferSize == null
            ? 8192
            : bufferSize < 1
                ? 1
                : bufferSize),
        _bufferPosition = 0,
        _isOpen = true {
    final file = fs.file(path);
    file.createSync(recursive: true);
    _fp = file.openSync(mode: FileMode.write);
  }

  @override
  int get length => _length;

  @override
  void flush() {
    if (_bufferPosition > 0) {
      if (_isOpen) {
        _fp.writeFromSync(_buffer, 0, _bufferPosition);
      }
      _bufferPosition = 0;
    }
  }

  Future<void> close() async {
    if (!_isOpen) {
      return;
    }
    flush();
    _isOpen = false;
    await _fp.close();
  }

  /// Write a byte to the end of the buffer.
  @override
  void writeByte(int value) {
    _buffer[_bufferPosition++] = value;
    if (_bufferPosition == _buffer.length) {
      flush();
    }
    _length++;
  }

  /// Write a set of bytes to the end of the buffer.
  @override
  void writeBytes(List<int> bytes, [int? len]) {
    len ??= bytes.length;
    if (_bufferPosition + len >= _buffer.length) {
      flush();

      if (_bufferPosition + len < _buffer.length) {
        for (int i = 0, j = _bufferPosition; i < len; ++i, ++j) {
          _buffer[j] = bytes[i];
        }
        _bufferPosition += len;
        _length += len;
        return;
      }
    }

    flush();
    _fp.writeFromSync(bytes, 0, len);
    _length += len;
  }

  @override
  void writeInputStream(InputStreamBase stream) {
    if (stream is InputStream) {
      final len = stream.length;

      if (_bufferPosition + len >= _buffer.length) {
        flush();

        if (_bufferPosition + len < _buffer.length) {
          for (int i = 0, j = _bufferPosition, k = stream.offset;
              i < len;
              ++i, ++j, ++k) {
            _buffer[j] = stream.buffer[k];
          }
          _bufferPosition += len;
          _length += len;
          return;
        }
      }

      if (_bufferPosition > 0) {
        flush();
      }
      _fp.writeFromSync(
          stream.buffer, stream.offset, stream.offset + stream.length);
      _length += stream.length;
    } else {
      var bytes = stream.toUint8List();
      writeBytes(bytes);
    }
  }

  /// Write a 16-bit word to the end of the buffer.
  @override
  void writeUint16(int value) {
    if (byteOrder == BIG_ENDIAN) {
      writeByte((value >> 8) & 0xff);
      writeByte((value) & 0xff);
      return;
    }
    writeByte((value) & 0xff);
    writeByte((value >> 8) & 0xff);
  }

  /// Write a 32-bit word to the end of the buffer.
  @override
  void writeUint32(int value) {
    if (byteOrder == BIG_ENDIAN) {
      writeByte((value >> 24) & 0xff);
      writeByte((value >> 16) & 0xff);
      writeByte((value >> 8) & 0xff);
      writeByte((value) & 0xff);
      return;
    }
    writeByte((value) & 0xff);
    writeByte((value >> 8) & 0xff);
    writeByte((value >> 16) & 0xff);
    writeByte((value >> 24) & 0xff);
  }

  /// Write a 64-bit word to the end of the buffer.
  @override
  void writeUint64(int value) {
    var topBit = 0x00;
    if (value & 0x8000000000000000 != 0) {
      topBit = 0x80;
      value ^= 0x8000000000000000;
    }
    if (byteOrder == BIG_ENDIAN) {
      writeByte(topBit | ((value >> 56) & 0xff));
      writeByte((value >> 48) & 0xff);
      writeByte((value >> 40) & 0xff);
      writeByte((value >> 32) & 0xff);
      writeByte((value >> 24) & 0xff);
      writeByte((value >> 16) & 0xff);
      writeByte((value >> 8) & 0xff);
      writeByte((value) & 0xff);
      return;
    }
    writeByte((value) & 0xff);
    writeByte((value >> 8) & 0xff);
    writeByte((value >> 16) & 0xff);
    writeByte((value >> 24) & 0xff);
    writeByte((value >> 32) & 0xff);
    writeByte((value >> 40) & 0xff);
    writeByte((value >> 48) & 0xff);
    writeByte(topBit | ((value >> 56) & 0xff));
  }

  List<int> subset(int start, [int? end]) {
    if (_bufferPosition > 0) {
      flush();
    }

    final pos = _fp.positionSync();
    if (start < 0) {
      start = pos + start;
    }
    var length = 0;
    if (end == null) {
      end = pos;
    } else if (end < 0) {
      end = pos + end;
    }
    length = (end - start);
    _fp.setPositionSync(start);
    final buffer = Uint8List(length);
    _fp.readIntoSync(buffer);
    _fp.setPositionSync(pos);
    return buffer;
  }
}
