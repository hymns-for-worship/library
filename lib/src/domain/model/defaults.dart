import 'package:hfw_core/hfw_core.dart';

extension DefaultPartsUtils on List<Portion> {
  List<String> defaults({
    bool firstAndLast = false,
    bool chorusOnlyOnce = false,
    bool autoAddChorus = true,
  }) {
    final verses = where((e) => e.name.startsWith('Verse ')).toList()
      ..sort((a, b) {
        final aName = a.name;
        final bName = b.name;
        return aName.compareTo(bName);
      });

    final parts = <String>[];
    var idx = 0;
    for (final verse in verses) {
      if (firstAndLast && idx != verses.length - 1) {
        idx++;
        continue;
      }
      parts.add(verse.name);
      if (autoAddChorus) {
        final isLast = idx == verses.length - 1;
        final hasLastChorus = any((e) => e.name.contains('Last Chorus'));
        if (isLast && hasLastChorus) {
          parts.add('Last Chorus');
        } else {
          if (chorusOnlyOnce && !isLast) {
          } else {
            parts.add('Chorus');
          }
        }
      }
      idx++;
    }

    return parts;
  }
}
