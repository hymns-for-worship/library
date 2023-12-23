import 'dart:io';

import 'package:example/screens/library/hymn/details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../instance.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final progress = signal<double?>(null);
  final errors = listSignal<String>([]);
  final total = signal<int?>(null);
  final current = signal<int?>(null);
  final currentName = signal<String?>(null);

  final topics = $.get<ListSignal<Topic>>();
  final hymnTopics = listSignal<HymnTopic>([]);
  final scriptures = listSignal<Scripture>([]);
  final hymnScriptures = listSignal<HymnScripture>([]);
  final hymns = $.get<ListSignal<Hymn>>();
  final hymnals = $.get<ListSignal<Hymnal>>();
  final hymnHymnals = listSignal<HymnHymnal>([]);
  final portions = listSignal<Portion>([]);
  final hymnPortions = listSignal<HymnPortion>([]);
  final stakeholders = $.get<ListSignal<Stakeholder>>();
  final hymnStakeholders = listSignal<HymnStakeholder>([]);

  final db = $.get<HfwDatabase>();

  late Connect<List<HymnTopic>> _hymnTopics;
  late Connect<List<Scripture>> _scriptures;
  late Connect<List<HymnScripture>> _hymnScriptures;
  late Connect<List<HymnHymnal>> _hymnHymnals;
  late Connect<List<Portion>> _portions;
  late Connect<List<HymnPortion>> _hymnPortions;
  late Connect<List<HymnStakeholder>> _hymnStakeholders;

  @override
  void initState() {
    _hymnTopics = connect(hymnTopics).from(db.getHymnTopics().watch());
    _scriptures = connect(scriptures).from(db.getScriptures().watch());
    _hymnScriptures =
        connect(hymnScriptures).from(db.getHymnScriptures().watch());
    _hymnHymnals = connect(hymnHymnals).from(db.getHymnHymnals().watch());
    _portions = connect(portions).from(db.getPortions().watch());
    _hymnPortions = connect(hymnPortions).from(db.getHymnPortions().watch());
    _hymnStakeholders =
        connect(hymnStakeholders).from(db.getHymnStakeholders().watch());

    super.initState();
  }

  @override
  void dispose() {
    _hymnTopics.dispose();
    _scriptures.dispose();
    _hymnScriptures.dispose();
    _hymnHymnals.dispose();
    _portions.dispose();
    _hymnPortions.dispose();
    _hymnStakeholders.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hymns for Worship Database'),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Import Hymnal',
            icon: const Icon(Icons.file_upload),
            onPressed: () async {
              progress.value = null;
              errors.clear();
              current.value = null;
              total.value = null;
              final result = await FilePicker.platform.getDirectoryPath(
                dialogTitle: 'Hymn Bundles',
              );
              // final result = await FilePicker.platform.pickFiles(
              //   type: FileType.custom,
              //   allowedExtensions: ['zip'],
              //   allowMultiple: true,
              // );
              if (result == null) return;
              var idx = 0;
              final files = Directory(result).listSync().whereType<File>();
              for (final file in files) {
                if (!file.path.endsWith('.zip')) continue;
                final filepath = file.path;
                try {
                  final bytes = await file.readAsBytes();
                  await $.get<ImportHymn>()(bytes);
                } catch (e, t) {
                  errors.add('$filepath - $e');
                  debugPrint('$filepath - $e');
                  debugPrintStack(stackTrace: t);
                }
                progress.value = ++idx / files.length;
                currentName.value = filepath.split('/').last.split('.').first;
                current.value = idx;
                total.value = files.length;
              }
              progress.value = null;
              currentName.value = null;
              current.value = null;
              total.value = null;
            },
          ),
          // IconButton(
          //   tooltip: 'Copy database out',
          //   icon: const Icon(Icons.file_download),
          //   onPressed: () async {
          //     final file = File(pbPath);
          //     final bytes = await file.readAsBytes();
          //     final result = await FilePicker.platform.saveFile(
          //       dialogTitle: 'Save Database File',
          //       fileName: 'hfw.db',
          //     );
          //     if (result == null) return;
          //     final file2 = File(result);
          //     await file2.writeAsBytes(bytes);
          //   },
          // ),
        ],
      ),
      body: ListView(
        children: [
          Builder(builder: (context) {
            final p = progress.watch(context);
            if (p == null) return const SizedBox.shrink();
            return LinearProgressIndicator(value: p);
          }),
          Builder(builder: (context) {
            final currentName = this.currentName.watch(context);
            final current = this.current.watch(context);
            final total = this.total.watch(context);
            if (current == null || total == null || currentName == null) {
              return const SizedBox.shrink();
            }
            return Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: colors.surfaceVariant,
              child: Center(
                child: Text(
                  '$current / $total - $currentName',
                  style:
                      TextStyle(fontSize: 18, color: colors.onSurfaceVariant),
                ),
              ),
            );
          }),
          Builder(builder: (context) {
            final errors = this.errors.watch(context);
            if (errors.isEmpty) return const SizedBox.shrink();
            return ExpansionTile(
              title: const Text('Errors'),
              children: [
                for (final error in errors)
                  ListTile(
                    leading: const Icon(Icons.error),
                    title: Text(error),
                  ),
              ],
            );
          }),
          Watch((context) {
            return ListTile(
              title: Text('Topics (${topics.length})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Watch((context) {
                    return ListView.builder(
                      itemCount: topics.length,
                      itemBuilder: (context, index) {
                        final item = topics[index];
                        return ListTile(
                          title: Text(item.name),
                        );
                      },
                    );
                  }),
                );
              },
            );
          }),
          Watch((context) {
            return ListTile(
              title: Text('Hymns (${hymns.length})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Watch((context) {
                    return ListView.builder(
                      itemCount: hymns.length,
                      itemBuilder: (context, index) {
                        final item = hymns[index];
                        return ListTile(
                          title: Text(item.number),
                          subtitle: Text(item.title),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HymnDetails(hymn: item),
                            ));
                          },
                        );
                      },
                    );
                  }),
                );
              },
            );
          }),
          Watch((context) {
            return ListTile(
              title: Text('Hymnals (${hymnals.length})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Watch((context) {
                    return ListView.builder(
                      itemCount: hymnals.length,
                      itemBuilder: (context, index) {
                        final item = hymnals[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.alias),
                        );
                      },
                    );
                  }),
                );
              },
            );
          }),
          Watch((context) {
            return ListTile(
              title: Text('Stakeholders (${stakeholders.length})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Watch((context) {
                    return ListView.builder(
                      itemCount: stakeholders.length,
                      itemBuilder: (context, index) {
                        final item = stakeholders[index];
                        return ListTile(
                          title: Text(item.name),
                        );
                      },
                    );
                  }),
                );
              },
            );
          }),
          // Watch((context)  {
          //   final items = assets.getAllAssets();
          //   return ExpansionTile(
          //     title: Text('Assets (${items.length})'),
          //     children: [
          //       for (final item in items)
          //         Builder(builder: (context) {
          //           final bytes = assets.getAssetBytesById(item.id);
          //           return ListTile(
          //             title: Text(item.filename),
          //             subtitle: bytes == null || item.ext != 'png' ? null : Image.memory(bytes),
          //           );
          //         }),
          //     ],
          //   );
          // }),
        ],
      ),
    );
  }
}
