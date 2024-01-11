import '../../../../../hfw_core.dart';
import '../../../model/defaults.dart';

import 'add_hymn_to_playlist.dart';
import 'add_text_to_playlist.dart';

class PlaylistExpertEntry {
  final HfwDatabase db;
  late final addHymn = AddHymnToPlaylist(db);
  late final addText = AddTextToPlaylist(db);

  PlaylistExpertEntry(this.db);

  Future<void> call(
    String userId,
    Playlist playlist,
    String value, {
    bool firstAndLast = false,
    bool chorusOnlyOnce = false,
    bool autoAddChorus = true,
  }) async {
    final sections = value.split(';');
    for (final section in sections) {
      // Section - eg: 1:12C4C
      final parts = section.split(':');
      final target = parts.first;
      final details = parts.last;
      final desc = target.toLowerCase().trim();
      if (target == details) {
        // Default Options
        if (desc == 'b' || desc == 'w') {
          await addText(
            userId,
            playlist,
            '',
            color: desc == 'b' ? '#000000' : '#FFFFFF',
          );
        } else {
          final hymns = await db.getHymns().get();
          final hymn = hymnFromHymnNumber(desc, hymns);
          if (hymn != null) {
            final allParts = await db //
                .getPortionsWithHymnIdByHymnId(hymn.id)
                .map((e) => e.portion)
                .get()
                .then((items) => items.toSet().toList());
            final defaults = allParts.defaults(
              firstAndLast: firstAndLast,
              chorusOnlyOnce: chorusOnlyOnce,
              autoAddChorus: autoAddChorus,
            );
            await addHymn(userId, playlist, hymn, parts: defaults);
          }
        }
      } else {
        if (desc == 'b' || desc == 'w') {
          await addText(
            userId,
            playlist,
            details,
            color: desc == 'b' ? '#000000' : '#FFFFFF',
          );
        } else {
          // Check for parts
          final hymns = await db.getHymns().get();
          final hymn = hymnFromHymnNumber(desc, hymns);
          if (hymn != null) {
            final allParts = await db //
                .getPortionsWithHymnIdByHymnId(hymn.id)
                .map((e) => e.portion)
                .map((e) => e.name)
                .get()
                .then((items) => items.toSet().toList());
            final filteredParts = convertParts(details, allParts);
            await addHymn(userId, playlist, hymn, parts: filteredParts);
          }
        }
      }
    } // PresTextSlide
  }

  List<String> convertParts(String source, List<String> allParts) {
    final results = <String>[];

    for (final item in source.trim().split('')) {
      // Verse 1, Verse 2, Verse 3, Verse 4, Verse 5, Verse 6, Verse 7, Verse 9
      if (int.tryParse(item) != null) {
        // Find matching verse
        final verse = 'Verse $item';
        if (allParts.contains(verse)) {
          results.add(verse);
        }
      } else {
        // Round, Refrain, Chorus, Last Chorus, Sanctus, Coda, Amen
        switch (item.toLowerCase()) {
          case 't':
            results.add('Title');
            break;
          case 'c':
            if (allParts.contains('Chorus')) {
              results.add('Chorus');
            }
            break;
          case 'l':
            if (allParts.contains('Last Chorus')) {
              results.add('Last Chorus');
            }
            break;
          case 'r':
            if (allParts.contains('Refrain')) {
              results.add('Refrain');
            }
            break;
          case 's':
            if (allParts.contains('Sanctus')) {
              results.add('Sanctus');
            }
            break;
          case 'a':
            if (allParts.contains('Amen')) {
              results.add('Amen');
            }
            break;
          case 'o':
            if (allParts.contains('Coda')) {
              results.add('Coda');
            }
            break;
          case 'd':
            if (allParts.contains('Round')) {
              results.add('Round');
            }
            break;
          default:
        }
      }
    }

    return results;
  }

  Hymn? hymnFromHymnNumber(String value, List<Hymn> hymns) {
    final revered = hymns.reversed.toList();
    for (final item in revered) {
      final number = item.number.trim();
      final q = value.trim();
      bool mNumber = number == q;
      // if (!mNumber && (number.startsWith('0') || number.length >= 4)) {
      //   // Remove leading 0s and check match
      //   String target = number;
      //   if (target.length > 4) {
      //     target = target.substring(target.length - 4);
      //   } else if (target.length == 4) {
      //     target = target.substring(1);
      //   }
      //   target = target.replaceAll(RegExp(r'^0+(?=.)'), '');
      //   mNumber = target == q.trim();
      // }
      if (mNumber) return item;
    }
    return null;
  }

  // List<String> splitSections(String value, List<String> separators) {
  //   final results = <String>[];
  //   int idx = 0;
  //   int lastIdx = idx;
  //   bool insideQuote = false;
  //   while (idx < value.length) {
  //     final char = value[idx];
  //     if (char == '"' || char == "'") {
  //       insideQuote = !insideQuote;
  //     } else if (separators.contains(char)) {
  //       if (idx != 0) {
  //         final section = value.substring(lastIdx, idx);
  //         results.add(section);
  //       }
  //       lastIdx = idx;
  //     }
  //     idx++;
  //   }
  //   if (results.isEmpty) {
  //     results.add(value);
  //   }
  //   return results;
  // }
}
