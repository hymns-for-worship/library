import 'package:fluent_ui/fluent_ui.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:pocketbase_ui/pocketbase_ui.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:signals/signals_flutter.dart';

import '../../instance.dart';

class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  State<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  final getPlaylists = GetPlaylists(
    client: $.get<HfwStudio>(),
    db: $.get<HfwDatabase>(),
  );
  final authController = $.get<AuthController>();
  late final userId = authController.userId;
  late final result = getPlaylists(userId).watch().toSignal();
  final subscribed = signal<bool?>(null);
  final selected = setSignal(<String>{});
  final search = TextEditingController();
  late final searchSignal = search.toSignal();
  late final sorted = computed<List<Playlist>>(() {
    final val = searchSignal.value.text.trim();
    final item = result.value.value ?? [];
    if (val.isEmpty) return item;
    return item.where((e) {
      final title = e.name?.valueOrNull ?? '';
      final description = e.description?.valueOrNull ?? '';
      return title.contains(val) || description.contains(val);
    }).toList();
  });

  @override
  void initState() {
    super.initState();
    retry().ignore();
  }

  Future<void> retry() async {
    try {
      await getPlaylists.subscribe(userId);
      subscribed.value = true;
    } catch (e) {
      subscribed.value = false;
      debugPrint('Error subscribing to playlists: $e');
    }
    final results = await $
        .get<HfwDatabase>()
        .getRecordModelsByCollectionName('playlists')
        .get();
    print('--- RESULTS; $userId ---');
    print('results: $results');
  }

  @override
  void dispose() {
    getPlaylists.dispose();
    result.dispose();
    subscribed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: const Text('Playlists'),
        commandBar: Watch((context) {
          return CommandBar(
            key: ValueKey(selected.length),
            mainAxisAlignment: MainAxisAlignment.end,
            primaryItems: [
              if (selected.isNotEmpty) ...[
                CommandBarButton(
                  icon: const Icon(FluentIcons.delete),
                  label: const Text('Delete'),
                  onPressed: () {},
                ),
                CommandBarButton(
                  icon: const Icon(FluentIcons.edit),
                  label: const Text('Edit'),
                  onPressed: selected.length > 1 ? null : () {},
                ),
                CommandBarButton(
                  icon: const Icon(FluentIcons.copy),
                  label: const Text('Duplicate'),
                  onPressed: selected.length > 1 ? null : () {},
                ),
              ] else ...[
                CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('Add'),
                  onPressed: () {},
                ),
              ],
            ],
            secondaryItems: [
              if (subscribed.value == false)
                CommandBarButton(
                  icon: const Icon(FluentIcons.refresh),
                  label: const Text('Retry'),
                  subtitle: const Text('Error connecting to server'),
                  onPressed: retry,
                ),
            ],
          );
        }),
      ),
      content: Watch.builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextBox(
                placeholder: 'Search',
                controller: search,
                expands: false,
                suffix: searchSignal.value.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(FluentIcons.clear),
                        onPressed: () => search.clear(),
                      ),
              ),
            ),
            Expanded(
              child: result.value.map(
                data: (results) {
                  if (sorted.value.isEmpty) {
                    if (subscribed.value == null) {
                      return const Center(child: ProgressRing());
                    }
                    return const Center(child: Text('No playlists found'));
                  }
                  return ListView.builder(
                    itemCount: sorted.value.length,
                    itemBuilder: (context, index) {
                      final item = sorted.value[index];
                      return Watch.builder(builder: (context) {
                        var title = item.name?.valueOrNull ?? 'No Name';
                        if (item.description?.valueOrNull != null) {
                          title += ' - ${item.description!.valueOrNull}';
                        }
                        var description = 'Updated: ';
                        description += timeago.format(item.updated);
                        String? trailing;
                        if (item.event?.valueOrNull != null) {
                          trailing = timeago.format(
                            DateTime.parse(item.event!),
                            locale: 'en_short',
                          );
                        }
                        return ListTile.selectable(
                          selectionMode: ListTileSelectionMode.multiple,
                          selected: selected.contains(item.id),
                          onSelectionChange: (val) {
                            if (val) {
                              selected.add(item.id);
                            } else {
                              selected.remove(item.id);
                            }
                          },
                          title: Text(title),
                          subtitle: Text(description),
                          trailing: trailing != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(trailing),
                                    const SizedBox(width: 10),
                                    const Icon(FluentIcons.event),
                                  ],
                                )
                              : null,
                        );
                      });
                    },
                  );
                },
                error: (e, t) =>
                    Center(child: Text('Error loading playlists: $e')),
                loading: () => const Center(child: ProgressRing()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  String? get valueOrNull {
    if (trim().isEmpty) return null;
    return this;
  }
}
