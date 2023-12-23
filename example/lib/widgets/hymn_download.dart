import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../instance.dart';
import '../screens/bundles.dart';

class HymnDownloadButton extends StatefulWidget {
  const HymnDownloadButton({
    super.key,
    required this.hymnId,
  });

  final String hymnId;

  @override
  State<HymnDownloadButton> createState() => _HymnDownloadButtonState();
}

class _HymnDownloadButtonState extends State<HymnDownloadButton> {
  final getDownloads = GetDownloads(
    client: $.get<HfwStudio>(),
    db: $.get<HfwDatabase>(),
  );
  final getBundles = GetHymnBundles($.get<HfwDatabase>());
  late final downloads = getDownloads(null).toSignal();
  late final bundles = getBundles().toSignal();
  final removeDownload = RemoveHymnDownload($.get<HfwDatabase>());

  @override
  void dispose() {
    getDownloads.dispose();
    downloads.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final bundle = bundles.value.value
          ?.firstWhereOrNull((e) => e.hymn.id == widget.hymnId);
      final download = downloads.value.value
          ?.firstWhereOrNull((e) => e.hymnId == widget.hymnId);
      final hasDownload = bundle != null;
      final needsUpdate = bundle != null &&
          download != null &&
          bundle.bundleHash != download.hash;
      final activeDownload =
          download != null ? activeDownloads[download.hymnId] : null;
      return IconButton(
        icon: hasDownload && !needsUpdate
            ? const Icon(Icons.delete)
            : activeDownload == null
                ? Icon(
                    Icons.file_download,
                    color: needsUpdate ? Colors.orange : null,
                  )
                : activeDownload.value.map(
                    data: (progress) => SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 2,
                      ),
                    ),
                    loading: () => const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    error: (_, __) =>
                        const Icon(Icons.error, color: Colors.red),
                  ),
        onPressed: (bundles.value.isLoading || downloads.value.isLoading)
            ? null
            : hasDownload
                ? () => removeDownload(download!.hymnId)
                : activeDownload != null
                    ? activeDownload.value.hasError
                        ? () => retryDownload(download!.hymnId)
                        : null
                    : () => downloadHymn(download!.hymnId),
      );
    });
  }
}
