import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:http/http.dart';
import 'package:signals/signals_flutter.dart';

import '../instance.dart';
import '../widgets/hymn_download.dart';
import 'library/hymn/details.dart';

final _progress = signal<double?>(null);
final _errors = listSignal<String>([]);
final _total = signal<int?>(null);
final _current = signal<int?>(null);
final _currentName = signal<String?>(null);

final _downloads =
    SignalContainer<AsyncState<double>, String, StreamSignal<double>>(
  (hymnId) {
    final downloader = DownloadHymn(
      db: $.get<HfwDatabase>(),
      client: $.get<HfwStudio>(),
      http: Client(),
    );
    return streamSignal<double>(
      () => downloader(hymnId),
      onDone: () {
        activeDownloads.remove(hymnId);
      },
    );
  },
  cache: true,
);
final activeDownloads = mapSignal<String, StreamSignal<double>>({});

void downloadHymn(String hymnId) {
  activeDownloads.putIfAbsent(hymnId, () => _downloads(hymnId));
  final current = activeDownloads[hymnId]!;
  if (current.value.value == 1) {
    activeDownloads.remove(hymnId);
    return;
  }
}

void retryDownload(String hymnId) {
  final current = activeDownloads[hymnId];
  if (current == null) return;
  activeDownloads.remove(hymnId);
  downloadHymn(hymnId);
}

typedef Download = (HymnDownload, Hymn?, GetBundlesHashesResult?);

class BundlesScreen extends StatefulWidget {
  const BundlesScreen({super.key});

  @override
  State<BundlesScreen> createState() => _BundlesScreenState();
}

class _BundlesScreenState extends State<BundlesScreen> {
  final importer = $.get<ImportHymn>();
  final removeDownload = RemoveHymnDownload($.get<HfwDatabase>());
  final getDownloads = GetDownloads(
    client: $.get<HfwStudio>(),
    db: $.get<HfwDatabase>(),
  );
  final getHymns = GetHymns($.get<HfwDatabase>());
  final getBundles = GetHymnBundles($.get<HfwDatabase>());
  late final downloads = getDownloads(null).toSignal();
  late final bundles = getBundles().toSignal();
  late final hymns = getHymns().toSignal();

  late final sortedDownloads = computed<List<Download>>(() {
    final items = <Download>[];
    final downloads = this.downloads.value.value ?? [];
    final hymns = this.hymns.value.value ?? [];
    final bundles = this.bundles.value.value ?? [];
    for (final download in downloads) {
      final hymnMatch = hymns.firstWhereOrNull(
        (hymn) => hymn.id == download.hymnId,
      );
      final bundleMatch = bundles.firstWhereOrNull(
        (bundle) => bundle.hymn.id == download.hymnId,
      );
      items.add((download, hymnMatch, bundleMatch));
    }
    // Sort by hymn title
    items.sort((a, b) => a.$1.hymnTitle.compareTo(b.$1.hymnTitle));
    return items;
  });

  @override
  void dispose() {
    getDownloads.dispose();
    downloads.dispose();
    hymns.dispose();
    bundles.dispose();
    sortedDownloads.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bundles'),
        actions: [
          IconButton(
            tooltip: 'Import Hymnal',
            icon: const Icon(Icons.file_upload),
            onPressed: () async {
              _progress.value = null;
              _errors.clear();
              _current.value = null;
              _total.value = null;
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['zip'],
                allowMultiple: true,
              );
              if (result == null) return;
              var idx = 0;
              final files = result.files;
              for (final file in files) {
                final filepath = file.path;
                if (filepath == null) continue;
                if (!filepath.endsWith('.zip')) continue;
                try {
                  final bytes = await File(filepath).readAsBytes();
                  await importer(bytes);
                } catch (e, t) {
                  _errors.add('$filepath - $e');
                  debugPrint('$filepath - $e');
                  debugPrintStack(stackTrace: t);
                }
                _progress.value = ++idx / files.length;
                _currentName.value = filepath.split('/').last.split('.').first;
                _current.value = idx;
                _total.value = files.length;
              }
              _progress.value = null;
              _currentName.value = null;
              _current.value = null;
              _total.value = null;
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Builder(builder: (context) {
              final p = _progress.watch(context);
              if (p == null) return const SizedBox.shrink();
              return LinearProgressIndicator(value: p);
            }),
          ),
          SliverToBoxAdapter(
            child: Builder(builder: (context) {
              final colors = Theme.of(context).colorScheme;
              final currentName = _currentName.watch(context);
              final current = _current.watch(context);
              final total = _total.watch(context);
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
          ),
          SliverToBoxAdapter(
            child: Builder(builder: (context) {
              final errors = _errors.watch(context);
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
          ),
          SliverFillRemaining(
            child: Watch((context) {
              if (downloads.value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final results = sortedDownloads.value;
              if (results.isEmpty) {
                return const Center(child: Text('No bundles found'));
              }
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final (download, hymn, bundle) = results[index];
                  final hasDownload = bundle != null;
                  return ListTile(
                    title: Text(download.hymnTitle),
                    subtitle: hasDownload ? Text(bundle.bundleHash!) : null,
                    leading: Icon(hasDownload ? Icons.check : Icons.error),
                    trailing: HymnDownloadButton(hymnId: download.hymnId),
                    onTap: hymn == null
                        ? null
                        : () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HymnDetails(hymnId: hymn.id),
                              ),
                            ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
