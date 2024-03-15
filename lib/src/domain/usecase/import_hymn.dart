import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:sqlite_storage/sqlite_storage.dart';

import 'package:xml/xml.dart';

import '../../data/source/archive/zip.dart';
import '../../data/source/database/database.dart';

// <?xml version="1.0" encoding="utf-8" standalone="yes"?>
// <contents xmlns="http://schema.PresentationCreator.net/HymnalInformation.xsd">
//   <hymnal key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJUzB1anBhcEJsY2VEbWVlRm5ndEhIaUZKV2tTSzBsLUw5bTZNMm4wTjZvMU81cC1QMHEtUTZyUnM=" guid="d886fbb1-9030-4ada-96ec-9a14bade5f9a" sku="HFWS" xmlns="http://schema.PresentationCreator.net/HymnalInformation.xsd">
//     <name>Hymns For Worship Supplement</name>
//     <alias>HFWS</alias>
//     <ISBN>0-9620615-0-6</ISBN>
//     <hymnalId>2</hymnalId>
//     <electronicVersion>1.5.518.5156</electronicVersion>
//     <hymn number="1002" title="Higher Ground" key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJUzB1anBhcEJsY2VEbWVlRm5ndEhIaUZKV2tTSzBsLUw5bTZNMm4wTjZvMU81cC1QMHEtUTZyUnM=" hymnId="715" sku="rjsec1002">
//       <electronicVersion>1.5.518.5156</electronicVersion>
//       <tuneName></tuneName>
//       <songLeaderInfo beatPattern="4" key="A" startingPitch="SOL" time="4/4" startingBeat="3+" startingPitchDirection="Down" />
//       <printSmallPortable>1002\1002 - Higher Ground - Print Small.PDF</printSmallPortable>
//       <printLargePortable>1002\1002 - Higher Ground - Print Large.PDF</printLargePortable>
//       <originator name="Gabriel, Charles H." role="Composer" type="Individual" stakeHolderId="188" />
//       <originator name="Hallal Music" role="Copyright Holder" type="Business" stakeHolderId="468" />
//       <originator name="Oatman, Johnson  Jr." role="Lyricist" type="Individual" stakeHolderId="708" />
//       <scripture>Philippians 3:14</scripture>
//       <topicalIndex>Aspiration</topicalIndex>
//       <topicalIndex>Reward</topicalIndex>
//       <hymnPortion portion="Verse 1" hymnPortionId="2808">
//         <text>I'm pressing on the upward way, new heights I'm gaining every day; Still praying as I onward bound, Lord, plant my feet on higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Verse 2" hymnPortionId="2809">
//         <text>My heart has no desire to stay where doubts arise and fears dismay. Tho' some may dwell where these abound, my prayer my aim is higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Verse 3" hymnPortionId="2810">
//         <text>I want to scale the utmost height, and catch a gleam of glory bright. But still I'll pray till heav'n I've found; Lord, lead me on to higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Chorus" hymnPortionId="7423">
//         <text>Lord, lift me up and let me stand, by faith on heaven's table land. A higher plane than I have found; Lord, plant my feet on higher ground.</text>
//       </hymnPortion>
//     </hymn>
//   </hymnal>
// </contents>
class ImportHymn {
  final HfwDatabase db;
  final DriftStorage storage;
  ImportHymn(this.db, this.storage);

  Future<void> call(Uint8List bytes) async {
    // TODO: Need to create bundle record model for database to render in list
    await db.transaction(() async {
      final archive = await extractZipAsync(bytes);

      final infos = archive //
          .files
          .where((e) => e.name.endsWith('Information.hixml'));
      if (infos.isEmpty) {
        throw Exception('No information.hixml file found');
      }
      final infoBytes = infos.first.content as List<int>;
      final str = String.fromCharCodes(infoBytes);

      final hymnId = await importInfo(str);

      await storage.io
          .file('downloads/bundles/$hymnId.zip')
          .writeAsBytes(bytes);
      // await db.storage.io.file('hymns/$hymnId.hixml').writeAsString(str);
    });
  }

  Future<String> importInfo(String str) async {
    final doc = XmlDocument.parse(str);
    final content = doc.findAllElements('contents').first;
    final version = int.tryParse(content.attr('version')) ?? 0;
    if (version < 2) {
      throw Exception('Unsupported version: $version');
    }
    final now = DateTime.now();
    final hymnals = doc.findAllElements('hymnal');
    String? hymnId, number;

    for (final hymnal in hymnals) {
      final hymns = hymnal.findAllElements('hymn');
      var i = 0;
      for (final hymn in hymns) {
        number = hymn.attr('number');
        if (kDebugMode) {
          print(
            'importing $number from ${hymnal.attr('alias')} - ${++i}/${hymns.length}',
          );
        }
        final id = hymn.attr('id');
        {
          // Hymn
          final notation = hymn.findAllElements('songLeaderInfo').first;
          final target = HymnsCompanion.insert(
            id: id,
            title: hymn.attr('title'),
            number: number,
            tuneName: Value(
                hymn.findAllElements('tuneName').firstOrNull?.innerText ?? ''),
            translatedTitle: Value(hymn.attr('translatedTitle')),
            status: Value(hymn.attr('status')),
            key: Value(notation.attr('key')),
            sku: Value(notation.attr('sku')),
            beatPattern: Value(notation.attr('beatPattern')),
            startingPitch: Value(notation.attr('startingPitch')),
            startingBeat: Value(notation.attr('startingBeat')),
            startingKey: Value(notation.attr('startingKey')),
            startingPitchDirection:
                Value(notation.attr('startingPitchDirection')),
            timeSignature: Value(notation.attr('time')),
            complexTimeSignature: Value(notation.attr('complexTime')),
            created: now,
            updated: now,
          );
          // TODO: Delete old doc subcollections as part of transactions
          // TODO: Add hymn links / recording
          await db.insertOrUpdateHymn(target);
          hymnId = id;
        }

        {
          // Hymnal
          final results = await db.createHymnal(
            hymnal.attr('id'),
            hymnal.findAllElements('name').first.innerText,
            hymnal.findAllElements('alias').first.innerText,
            now,
            now,
          );
          await db.createHymnHymnal(
            results.first.id,
            hymnId,
            now,
            now,
          );
        }
        {
          // Topics
          for (final node in doc.findAllElements('topicalIndex')) {
            final results = await db.createTopic(
              node.attr('id'),
              node.innerText,
              node.attr('alias'),
              now,
              now,
            );
            await db.createHymnTopic(
              results.first.id,
              hymnId,
              now,
              now,
            );
          }
        }
        {
          // Category
          for (final node in doc.findAllElements('category')) {
            final results = await db.createCategory(
              node.attr('id'),
              node.findElements('text').map((e) => e.innerText).join('\n'),
              node.attr('name'),
              now,
              now,
            );
            await db.createHymnCategory(
              results.first.id,
              hymnId,
              now,
              now,
            );
          }
        }
        {
          // Scriptures
          for (final node in doc.findAllElements('scripture')) {
            final results = await db.createScripture(
              node.attr('id'),
              node.innerText,
              now,
              now,
            );
            await db.createHymnScripture(
              results.first.id,
              hymnId,
              now,
              now,
            );
          }
        }
        {
          // Links
          for (final node in doc.findAllElements('hymnLink')) {
            await db.createLink(
              node.attr('id'),
              node.attr('title'),
              node.attr('description'),
              node.attr('url'),
              hymnId,
              now,
              now,
            );
          }
        }
        {
          // Portions
          for (final node in doc.findAllElements('hymnPortion')) {
            final results = await db.createPortion(
              node.attr('id'),
              node.attr('portion'),
              node.findAllElements('text').map((e) => e.innerText).join('\n'),
              node.attr('hymnPortionId'),
              now,
              now,
            );
            await db.createHymnPortion(
              results.first.id,
              hymnId,
              now,
              now,
            );
          }
        }
        {
          // Stakeholders
          for (final node in doc.findAllElements('originator')) {
            final results = await db.createStakeholder(
              node.attr('stakeHolderId'),
              node.attr('name'),
              now,
              now,
            );
            await db.createHymnStakeholder(
              results.first.id,
              hymnId,
              node.attr('role'),
              now,
              now,
            );
          }
        }
      }
    }

    return hymnId!;
  }
}

extension on XmlElement {
  String attr(String key) {
    final value = getAttribute(key) ?? '';
    return value.trim();
  }
}
