// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';

import 'package:sqlite_storage/sqlite_storage.dart';

import 'package:xml/xml.dart';

import '../../data/source/archive/zip.dart';

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
  final DriftStorage db;
  ImportHymn(this.db);

  Future<void> call(Uint8List bytes) async {
    // TODO: Need to create bundle record model for database to render in list
    await db.transaction(() async {
      final archive = await extractZipAsync(bytes);

      // final hash = sha256.convert(bytes).toString();
      // final bundle = await db.getBundleByHash(hash).getSingleOrNull();
      // if (bundle != null) {
      //   return;
      // }

      // final now = DateTime.now();

      final infos = archive //
          .files
          .where((e) => e.name.endsWith('Information.hixml'));
      if (infos.isEmpty) {
        throw Exception('No information.hixml file found');
      }
      final infoBytes = infos.first.content as List<int>;
      final str = String.fromCharCodes(infoBytes);

      print(('DOWNLOAD_IMPORT', str));
      final hymnId = await importInfo(str);
      print(('DOWNLOAD_IMPORT_DONE', hymnId));

      final file = db.io.file('downloads/bundles/$hymnId.zip');
      await file.writeAsBytes(bytes);
      print(('DOWNLOAD_COMPLETE', bytes.length));
    });
  }

  Future<String> importInfo(String str) async {
    final doc = XmlDocument.parse(str);
    final content = doc.findAllElements('contents').first;
    final version = num.tryParse(content.attr('version')) ?? 0;
    if (version < 2) {
      throw Exception('Unsupported version: $version');
    }

    final hymnals = doc.findAllElements('hymnal');
    String? hymnId;
    for (final hymnal in hymnals) {
      final hymns = hymnal.findAllElements('hymn');
      var i = 0;
      for (final hymn in hymns) {
        final id = hymnId = hymn.attr('id');
        final number = hymn.attr('number');
        print(
          'importing $number from ${hymnal.attr('sku')} - ${++i}/${hymns.length}',
        );
        final hymnDoc = db.docs.collection('hymns').doc(id);
        final snapshot = await hymnDoc.get();
        if (snapshot != null && snapshot.exists) {
          await db.docs.remove(hymnDoc.path, recursive: true);
        }
        {
          // Hymn
          final notation = hymn.findAllElements('songLeaderInfo').first;
          // TODO: Delete old doc subcollections as part of transactions
          // TODO: Add hymn links / recording
          await hymnDoc.set({
            'id': id,
            'title': hymn.attr('title'),
            'number': number,
            'tuneName':
                hymn.findAllElements('tuneName').firstOrNull?.innerText ?? '',
            'translatedTitle': hymn.attr('translatedTitle'),
            'status': hymn.attr('status'),
            'key': notation.attr('key'),
            'sku': notation.attr('sku'),
            'beatPattern': notation.attr('beatPattern'),
            'startingPitch': notation.attr('startingPitch'),
            'startingBeat': notation.attr('startingBeat'),
            'startingKey': notation.attr('key'),
            'startingPitchDirection': notation.attr('startingPitchDirection'),
            'timeSignature': notation.attr('time'),
            'complexTimeSignature': notation.attr('complexTime'),
            'download_link':
                'https://hymns-for-worship.fra1.cdn.digitaloceanspaces.com/bundles/$id.zip',
          });
        }

        {
          // Hymnal
          final _doc = db //
              .docs
              .collection('hymnals')
              .doc(hymnal.attr('id'));
          await _doc.set({
            'id': hymnal.attr('id'),
            'sku': hymnal.attr('sku'),
            'name': hymnal.findAllElements('name').first.innerText,
            'alias': hymnal.findAllElements('alias').first.innerText,
          });
          final col = hymnDoc.collection('hymnals');
          final current = await col.getAll();
          if (!current.any((e) {
            final data = e.data ?? {};
            return data['hymnal_id'] == _doc.id && data['hymn_id'] == hymnId;
          })) {
            await col.doc().set({
              'hymnal_id': _doc.id,
              'hymn_id': hymnId,
            });
          }
        }
        {
          // Topics
          for (final node in doc.findAllElements('topicalIndex')) {
            final _doc = db.docs.collection('topics').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'name': node.innerText,
              'alias': node.attr('alias'),
            });
            final col = hymnDoc.collection('topics');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['topic_id'] == _doc.id && data['hymn_id'] == hymnId;
            })) {
              await col.doc().set({
                'topic_id': _doc.id,
                'hymn_id': hymnId,
              });
            }
          }
        }
        {
          // Category
          for (final node in doc.findAllElements('category')) {
            final _doc = db.docs.collection('categories').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'text':
                  node.findElements('text').map((e) => e.innerText).join('\n'),
              'name': node.attr('name'),
            });
            final col = hymnDoc.collection('categories');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['category_id'] == _doc.id &&
                  data['hymn_id'] == hymnId;
            })) {
              await col.doc().set({
                'category_id': _doc.id,
                'hymn_id': hymnId,
              });
            }
          }
        }
        {
          // Scriptures
          for (final node in doc.findAllElements('scripture')) {
            final _doc = db.docs.collection('scriptures').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'name': node.innerText,
            });
            final col = hymnDoc.collection('scriptures');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['scripture_id'] == _doc.id &&
                  data['hymn_id'] == hymnId;
            })) {
              await col.doc().set({
                'scripture_id': _doc.id,
                'hymn_id': hymnId,
              });
            }
          }
        }
        {
          // Portions
          for (final node in doc.findAllElements('hymnPortion')) {
            final _doc = db.docs.collection('portions').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'portion': node.attr('portion'),
              'hymnPortionId': node.attr('hymnPortionId'),
              'text': node
                  .findAllElements('text')
                  .map((e) => e.innerText)
                  .join('\n'),
            });
            final col = hymnDoc.collection('portions');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['portion_id'] == _doc.id && data['hymn_id'] == hymnId;
            })) {
              await col.doc().set({
                'portion_id': _doc.id,
                'hymn_id': hymnId,
              });
            }
          }
        }
        {
          // Hymn Links
          for (final node in doc.findAllElements('hymnLink')) {
            final _doc = db.docs.collection('links').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'url': node.attr('url'),
              'title': node.attr('title'),
              'description': node.attr('description'),
            });
            final col = hymnDoc.collection('links');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['link_id'] == _doc.id && data['hymn_id'] == hymnId;
            })) {
              await col.doc().set({
                'link_id': _doc.id,
                'hymn_id': hymnId,
              });
            }
          }
        }
        {
          // Stakeholders
          for (final node in doc.findAllElements('originator')) {
            final _doc =
                db.docs.collection('stakeholders').doc(node.attr('id'));
            await _doc.set({
              'id': node.attr('id'),
              'name': node.attr('name'),
              'stakeHolderId': node.attr('stakeHolderId'),
            });
            final col = hymnDoc.collection('stakeholders');
            final current = await col.getAll();
            if (!current.any((e) {
              final data = e.data ?? {};
              return data['stakeholder_id'] == _doc.id &&
                  data['hymn_id'] == hymnId &&
                  data['role'] == node.attr('role');
            })) {
              await col.doc().set({
                'stakeholder_id': _doc.id,
                'hymn_id': hymnId,
                'role': node.attr('role'),
              });
            }
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
