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
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../data/source/database/database.dart';
import '../import_hymn.dart';

class GetLibrary {
  final SharedPreferences prefs;
  final HfwDatabase db;
  GetLibrary(this.prefs, this.db);
  late final importHymn = ImportHymn(db);

  static const String _key = 'HymnalsXml';
  static const url =
      'https://hymns-for-worship.fra1.cdn.digitaloceanspaces.com/assets/hymnals.xml.gz';

  Future<void> call() async {
    final xml = prefs.getString(_key);
    if (xml != null) {
      await _parse(xml);
    } else {
      final asset = await rootBundle.loadString('assets/$_key.xml');
      await _parse(asset);
      await _save(asset);
    }
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final xml = res.body;
        await _parse(xml);
        await _save(xml);
      }
    } catch (e, t) {
      if (kDebugMode) {
        print('Error fetching hymnal versions: $e $t');
      }
    }
  }

  Future<void> _save(String xml) async {
    await prefs.setString(_key, xml);
  }

  Future<void> _parse(String xml) async {
    await importHymn.parseHymnInformationFile(db, xml);
  }
}
