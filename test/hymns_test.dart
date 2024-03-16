import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hfw_core/src/data/source/database/database.dart';
import 'package:hfw_core/src/domain/usecase/import_hymn.dart';
import 'package:sqlite_storage/sqlite_storage.dart';

void main() async {
  group('hymns', () {
    late DriftStorage storage;
    late HfwDatabase db;
    late ImportHymn importer;

    setUp(() {
      storage = DriftStorage(NativeDatabase.memory());
      db = HfwDatabase(NativeDatabase.memory());
      importer = ImportHymn(db, storage);
    });

    tearDown(() async {
      await db.close();
      await storage.close();
    });

    group('import', () {
      test('valid info', () async {
        final id = await importer.importInfo(HYMN_002.trim());

        expect(id, '000000000000004');

        final hymn = await db.getHymnByNumber('002').getSingleOrNull();

        expect(hymn != null, true);
        expect(hymn!.id, id);
        expect(hymn.number, '002');
        expect(hymn.title, 'Hallelujah! Praise Jehovah');

        final hymnal = await db.getHymnalsByHymnId(id).getSingleOrNull();

        expect(hymnal != null, true);
        expect(hymnal!.id, '000000000000001');
        expect(hymnal.name, 'Hymns For Worship (Revised)');
        expect(hymnal.alias, 'HFWR');

        final bundle = await storage //
            .io
            .file('downloads/bundles/$id.zip')
            .readAsBytes();
        expect(bundle == null, true);
      });

      test('valid bundle', () async {
        final archive = Archive();
        final strBytes = utf8.encode(HYMN_002);
        archive.addFile(ArchiveFile(
          '002/Information.hixml',
          strBytes.length,
          strBytes,
        ));
        final bytes = Uint8List.fromList(ZipEncoder().encode(archive)!);
        await importer(bytes);

        final hymns = await db.getHymns().get();
        final id = hymns.first.id;

        expect(id, '000000000000004');

        final hymn = await db.getHymnByNumber('002').getSingleOrNull();

        expect(hymn != null, true);
        expect(hymn!.id, id);
        expect(hymn.number, '002');
        expect(hymn.title, 'Hallelujah! Praise Jehovah');

        final hymnal = await db.getHymnalsByHymnId(id).getSingleOrNull();

        expect(hymnal != null, true);
        expect(hymnal!.id, '000000000000001');
        expect(hymnal.name, 'Hymns For Worship (Revised)');
        expect(hymnal.alias, 'HFWR');

        final bundle = await storage //
            .io
            .file('downloads/bundles/$id.zip')
            .readAsBytes();
        expect(bundle != null, true);
      });

      test('invalid', () async {
        expect(importer.importInfo(''), throwsException);
      });
    });
  });
}

const HYMN_002 = '''
<contents xmlns="http://schema.PresentationCreator.net/HymnalInformation.xsd" version="2">
  <hymnal id="000000000000001" status="Purchased" ownerId="997" guid="6e59d54f-9fc6-4b06-a4e3-5f7e464f157a" key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJKDBSamVhdkJpY3NEZWVkRilnSEhGaVdKUmswSy1sOUw2bTJNMG42TjFvNU8tcDBQLXE2UQ==" sku="HFWR">
    <name>Hymns For Worship (Revised)</name>
    <alias>HFWR</alias>
    <ISBN>0-9620615-0-6</ISBN>
    <hymnalId>000000000000001</hymnalId>
    <electronicVersion>2.0.0.0</electronicVersion>
    <hymn id="000000000000004" number="002" title="Hallelujah! Praise Jehovah" translatedTitle="" hymnId="000000000000004" status="Browsable" key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJKDBSamVhdkJpY3NEZWVkRilnSEhGaVdKUmswSy1sOUw2bTJNMG42TjFvNU8tcDBQLXE2UQ==" sku="rjsec002">
      <electronicVersion>2.0.0.31</electronicVersion>
      <tuneName></tuneName>
      <arrangement></arrangement>
      <language>US English</language>
      <copyright></copyright>
      <disclaimer></disclaimer>
      <songLeaderInfo beatPattern="4" key="G" startingPitch="SOL" complexTime="" time="4/4" startingBeat="4" startingPitchDirection="Down"/>
      <category id="hcdtp5ebb7c5b0f" name="Public Domain" price="4.99" limited="false">
        <text>Unlimited Use and Copies</text>
      </category>
      <topicalIndex id="000000000000147" alias="P-00">Praise/Adoration</topicalIndex>
      <scripture id="000000000039866">Psalm 148:2</scripture>
      <originator id="000000000000008" name="Kirkpatrick, William J." role="Composer" type="Individual" stakeholderType="I" stakeHolderId="000000000001268"/>
      <originator id="000000000000009" name="Psalm 148" role="Lyricist" type="Business" stakeholderType="H" stakeHolderId="000000000000983"/>
      <originator id="000000000000010" name="Public Domain" role="Copyright Holder" type="Business" stakeholderType="B" stakeHolderId="000000000000992"/>
      <originator id="000000000039720" name="Kirkpatrick, William J." role="Arranger" type="Individual" stakeholderType="I" stakeHolderId="000000000001268"/>
      <originator id="000000000041235" name="Public Domain" role="Copyright Manager" type="Business" stakeholderType="B" stakeHolderId="000000000000992"/>
      <hymnPortion id="000000000000011" portion="Verse 1" hymnPortionId="000000000000011">
        <text>Hallelujah, praise Jehovah! From the heavens praise His name; Praise Jehovah in the highest; All His angels praise proclaim. All His hosts together praise Him, Sun and moon and stars on high; Praise Him, O ye heav'n of heavens, And ye floods above the sky.</text>
      </hymnPortion>
      <hymnPortion id="000000000000012" portion="Verse 2" hymnPortionId="000000000000012">
        <text>Let them praises give Jehovah! They were made at His command; Them forever He established: His decree shall ever stand. From the earth, O praise Jehovah, all ye floods, ye dragons all, fire and hail and snow and vapors, stormy winds that hear Him call.</text>
      </hymnPortion>
      <hymnPortion id="000000000000013" portion="Verse 3" hymnPortionId="000000000000013">
        <text>All ye fruitful trees and cedars, All ye hills and mountains high, Creeping things and beasts and cattle, Birds that in the heavens fly, Kings of earth, and all ye people, Princes great, earth's judges all; Praise His name, young men and maidens, Aged men, and children small.</text>
      </hymnPortion>
      <hymnPortion id="000000000000014" portion="Chorus" hymnPortionId="000000000000014">
        <text>Let them praises give Jehovah, For His name alone is high, And His glory is exalted, And His glory is exalted, And His glory is exalted Far above the earth and sky.</text>
      </hymnPortion>
      <printSmallPortable>002/002 - Hallelujah Praise Jehovah - Print Small.pdf</printSmallPortable>
      <printLargePortable>002/002 - Hallelujah Praise Jehovah - Print Large.pdf</printLargePortable>
      <hymnLink id="yqmlysy32p3akgu" url="http://kleinwood.com/media/uploads/sermons/2019/10/Hallelujah_Praise_Jehovah_-_John_Parsons-1570037663.mp3" title="Kleinwood" description="For Personal Use Only"/>
      <hymnLink id="7vzd76fm82pnoys" url="https://www.youtube.com/watch?v=Dj31T27oXCk" title="Table Singers" description="Lyrics/no slides"/>
      <hymnLink id="dxfrsicljqrhyp2" url="https://www.youtube.com/watch?v=mfHeObgEmrk" title="Harding University Choir" description="no slides"/>
    </hymn>
  </hymnal>
</contents>
''';
