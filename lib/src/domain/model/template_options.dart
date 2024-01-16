import 'package:flutter/services.dart';

class TemplateOptions {
  static List<String> values = [
    'Single Slide Template (Fast Transition)--Widescreen',
    'Single Slide Template (Fast Transition)',
    'Single Slide Template (Medium Transition)',
    'Single Slide Template (Medium Transition)--Widescreen',
    'Single Slide Template (Slow Transition)',
    'Single Slide Template (Slow Transition)--Widescreen',
    'Single Slide Template (No Transition)',
    'Single Slide Template (No Transition)--Widescreen',
  ];

  Future<Uint8List> get(String key, [String ext = '.pptx']) async {
    return getRaw('assets/templates/$key.pptx');
  }

  Future<Uint8List> getRaw(String key) async {
    try {
      final buffer = await rootBundle.load(key);
      final bytes = buffer.buffer.asUint8List();
      return bytes;
    } catch (e) {
      return throw Exception('Error loading asset: $e');
    }
  }

  static String shortName(String item) {
    return item.replaceAll('Single Slide Template ', '').replaceAll('(', '').replaceAll(')', '').replaceAll('--', ' ');
  }
}
