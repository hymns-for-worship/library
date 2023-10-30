import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hfw_library/hfw_library_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  runApp(MyApp(appDir: dir));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appDir});

  final Directory appDir;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Example(appDir: appDir),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key, required this.appDir});

  final Directory appDir;

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double? progress;
  int? total, current;
  String? currentName;
  List<String> errors = [];
  late final String pbPath = '${widget.appDir.path}/hfw.db';
  late final db = sqlite3.open(pbPath);

  late final topics = TopicsRepository(db);
  late final hymnTopics = HymnTopicsRepository(db);
  late final scriptures = ScripturesRepository(db);
  late final hymnScriptures = HymnScripturesRepository(db);
  late final hymns = HymnsRepository(db);
  late final hymnals = HymnalsRepository(db);
  late final hymnHymnals = HymnHymnalsRepository(db);
  late final portions = PortionsRepository(db);
  late final stakeholders = StakeholdersRepository(db);
  late final hymnStakeholders = HymnStakeholdersRepository(db);
  late final hymnPortions = HymnPortionsRepository(db);
  late final assets = AssetsRepository(db);

  late final importer = ImportHymn(
    topics: topics,
    hymnTopics: hymnTopics,
    hymnPortions: hymnPortions,
    hymnScriptures: hymnScriptures,
    hymns: hymns,
    hymnStakeholders: hymnStakeholders,
    hymnals: hymnals,
    hymnHymnals: hymnHymnals,
    scriptures: scriptures,
    portions: portions,
    stakeholders: stakeholders,
    assets: assets,
  );

  @override
  void initState() {
    super.initState();
    db.updates.listen((_) => setState(() {}));
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
              if (mounted) {
                setState(() {
                  errors = [];
                  progress = null;
                  current = null;
                  total = null;
                });
              }
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['zip'],
                allowMultiple: true,
              );
              if (result == null) return;
              var idx = 0;
              for (final item in result.files) {
                final file = File(item.path!);
                final bytes = await file.readAsBytes();
                try {
                  importer.execute(bytes);
                  await Future.delayed(const Duration(milliseconds: 10));
                } catch (e) {
                  if (mounted) {
                    setState(() {
                      errors.add('${item.path} - $e');
                    });
                  }
                }
                if (mounted) {
                  setState(() {
                    progress = ++idx / result.files.length;
                    currentName = item.name;
                    current = idx;
                    total = result.files.length;
                  });
                }
              }
              if (mounted) {
                setState(() {
                  progress = null;
                  current = null;
                  total = null;
                });
              }
            },
          ),
          IconButton(
            tooltip: 'Copy database out',
            icon: const Icon(Icons.file_download),
            onPressed: () async {
              final file = File(pbPath);
              final bytes = await file.readAsBytes();
              final result = await FilePicker.platform.saveFile(
                dialogTitle: 'Save Database File',
                fileName: 'hfw.db',
              );
              if (result == null) return;
              final file2 = File(result);
              await file2.writeAsBytes(bytes);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          if (progress != null) LinearProgressIndicator(value: progress),
          if (currentName != null && current != null && total != null)
            Container(
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
            ),
          if (errors.isNotEmpty)
            ExpansionTile(
              title: const Text('Errors'),
              children: [
                for (final error in errors)
                  ListTile(
                    leading: const Icon(Icons.error),
                    title: Text(error),
                  ),
              ],
            ),
          Builder(builder: (context) {
            return ListTile(
              title: Text('Topics (${topics.count()})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SignalWatch(
                    signal: topics,
                    builder: (context, items, child) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item.name),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
          Builder(builder: (context) {
            return ListTile(
              title: Text('Hymns (${hymns.count()})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SignalWatch(
                    signal: hymns,
                    builder: (context, items, child) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item.number),
                            subtitle: Text(item.title),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
          Builder(builder: (context) {
            return ListTile(
              title: Text('Hymnals (${hymnals.count()})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SignalWatch(
                    signal: hymnals,
                    builder: (context, items, child) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.alias),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
          Builder(builder: (context) {
            return ListTile(
              title: Text('Stakeholders (${stakeholders.count()})'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SignalWatch(
                    signal: stakeholders,
                    builder: (context, items, child) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item.name),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
          // Builder(builder: (context) {
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
