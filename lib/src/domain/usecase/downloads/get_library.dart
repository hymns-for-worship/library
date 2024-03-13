// <?xml version="1.0" encoding="utf-8" standalone="yes"?>
// <content>
//     <version hymnal="HFWR" sku="RJSEC000" version="2.0.0.25"
//         title="SING AND REJOICE IN THE SAVIOR'S BIRTH" number="000" size="2760646"
//         hash="f0f2b2a27d1a1d3e0b8b6e2772c9665af88409f270a10b66e46f66d7cb76e329"
//         link="https://hymnsforworship.studio/api/files/epketxbdz4cccoj/lfxpjfrt9gp746m/rjsec000_LSiWDcSoPM.zip" />
//     <version hymnal="HFWR" sku="RJSEC001" version="2.0.0.24" title="HOLY, HOLY, HOLY" number="001"
//         size="3057560" hash="76817138f6eaf8b1100719d8579d944834d088b17cc76d7c4ee6a1972122fe6b"
//         link="https://hymnsforworship.studio/api/files/epketxbdz4cccoj/zbp7ack6f0irjck/rjsec001_5Ncy526MUi.zip" />
// </content>

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../import_hymn.dart';

class GetLibrary {
  final SharedPreferences prefs;
  final HfwStudio pb;
  final HfwDatabase db;
  GetLibrary(this.prefs, this.db, this.pb);
  late final importHymn = ImportHymn(db.storage);

  static const String _key = 'HymnalsCheck';
  static const url =
      'https://hymns-for-worship.fra1.cdn.digitaloceanspaces.com/assets/hymnals.xml.gz';

  Stream<double> call() async* {
    yield 0;
    // final xml = prefs.getString(_key);
    // if (xml != null) {
    //   await _parse(xml);
    // } else {
    //   final raw = await rootBundle.load('assets/hymnals.xml.gz');
    //   final bytes = raw.buffer.asUint8List();
    //   final decoder = GZipDecoder();
    //   final asset = utf8.decode(decoder.decodeBytes(bytes));
    //   await _parse(asset);
    //   await _save(asset);
    // }
    // try {
    //   final res = await http.get(Uri.parse(url));
    //   if (res.statusCode == 200) {
    //     final xml = res.bodyBytes;
    //     final decoder = GZipDecoder();
    //     final asset = utf8.decode(decoder.decodeBytes(xml));
    //     await _parse(asset);
    //     await _save(asset);
    //   }
    // } catch (e, t) {
    //   if (kDebugMode) {
    //     print('Error fetching hymnal versions: $e $t');
    //   }
    // }
    var lastCheck = prefs.getInt(_key);
    if (lastCheck == null) {
      yield 0.1;
      final hymns = await db.getHymns().get();
      if (hymns.isEmpty) {
        lastCheck = 0;
      } else {
        lastCheck = hymns
            .map((e) => e.updated.millisecondsSinceEpoch)
            .reduce((value, element) => value > element ? value : element);
      }
      yield 0.2;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    final hymns = await pb.collection('hymns').getFullList(
          filter:
              "updated > '${DateTime.fromMillisecondsSinceEpoch(lastCheck).toIso8601String()}'",
          fields: 'info',
        );
    var i = 0;
    yield i / hymns.length;
    for (final hymn in hymns) {
      try {
        final info = hymn.getStringValue('info');
        await importHymn.importInfo(info);
        if (kDebugMode) {
          print('imported ${i + 1} of ${hymns.length}');
        }
      } catch (e, t) {
        if (kDebugMode) {
          print('Error importing hymn: $e $t');
        }
      } finally {
        i++;
        yield i / hymns.length;
      }
    }
    await prefs.setInt(_key, now);
    yield 1;
  }
}
