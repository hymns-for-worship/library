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
import 'package:http/http.dart' as http;
import 'package:sqlite_storage/sqlite_storage.dart';
import 'package:xml/xml.dart';

class GetVersions {
  // final HfwDatabase db;
  final DriftStorage storage;
  const GetVersions(this.storage);

  static const String _key = 'HymnalVersions';
  static const url =
      'https://hymns-for-worship.fra1.cdn.digitaloceanspaces.com/assets/hymnal-versions.xml';

  HymnalVersions _parse(String xml) {
    final doc = XmlDocument.parse(xml);
    final root = doc.rootElement;
    final versions = root.findAllElements('version').map((e) {
      final id = e.getAttribute('id')!;
      final hymnal = e.getAttribute('hymnal')!;
      final sku = e.getAttribute('sku')!;
      final version = e.getAttribute('version')!;
      final title = e.getAttribute('title')!;
      final number = e.getAttribute('number')!;
      final size = e.getAttribute('size')!;
      final hash = e.getAttribute('hash')!;
      final link = e.getAttribute('link')!;
      return (
        id: id,
        hymnal: hymnal,
        sku: sku,
        version: version,
        title: title,
        number: number,
        size: size,
        hash: hash,
        link: link,
      );
    }).toList();
    return (hymns: versions,);
  }

  Future<void> _save(String xml) async {
    await storage.kv.$string.set(_key, xml);
    await import(_parse(xml));
  }

  Future<void> import(HymnalVersions versions) async {
    return storage.transaction(() async {
      final now = DateTime.now().toIso8601String();
      for (final item in versions.hymns) {
        final doc = storage.docs.collection('hymns').doc(item.id);
        final snapshot = await doc.get();
        if (snapshot != null && snapshot.exists) continue;
        await doc.set({
          'id': item.id,
          'title': item.title,
          'number': item.number,
          'sku': item.sku,
          'download_link': item.link,
          'download_size': item.size,
          'download_hash': item.hash,
          'created': now,
          'updated': now,
        });
      }
    });
  }

  Stream<HymnalVersions> call() async* {
    final xml = await storage.kv.$string.get(_key);
    if (xml != null) {
      yield _parse(xml);
    } else {
      final asset = await rootBundle.loadString('assets/$_key.xml');
      yield _parse(asset);
      await _save(asset);
    }
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final xml = res.body;
        yield _parse(xml);
        await _save(xml);
      }
    } catch (e, t) {
      if (kDebugMode) {
        print('Error fetching hymnal versions: $e $t');
      }
    }
  }
}

typedef HymnalVersions = ({
  List<HymnVersion> hymns,
});

typedef HymnVersion = ({
  String id,
  String hymnal,
  String sku,
  String version,
  String title,
  String number,
  String size,
  String hash,
  String link,
});
