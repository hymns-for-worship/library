import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';

class HymnsScreen extends StatefulWidget {
  const HymnsScreen({super.key});

  @override
  State<HymnsScreen> createState() => _HymnsScreenState();
}

class _HymnsScreenState extends State<HymnsScreen> {
  final items = GetHymns($.get<HfwDatabase>())().toSignal();
  final sortField = signal(HymnSortField.number);
  final sortAsc = signal(true);

  late final sorted = computed(() {
    final items = (this.items.value.value ?? []).toList();
    switch (sortField.value) {
      case HymnSortField.title:
        items.sort((a, b) {
          final aVal = a.title;
          final bVal = b.title;
          if (sortAsc.value) {
            return aVal.compareTo(bVal);
          } else {
            return bVal.compareTo(aVal);
          }
        });
        break;
      case HymnSortField.number:
        items.sort((a, b) {
          double num(String val) {
            final result = val.replaceAll(RegExp(r'[^0-9.]'), '');
            return double.parse(result);
          }

          final aVal = num(a.number);
          final bVal = num(b.number);
          if (sortAsc.value) {
            return aVal.compareTo(bVal);
          } else {
            return bVal.compareTo(aVal);
          }
        });
        break;
      default:
    }
    return items;
  });

  @override
  void dispose() {
    items.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = items.watch(context);
    if (state.hasValue) {
      final value = state.requireValue;
      return Watch.builder(builder: (context) {
        if (value.isEmpty) {
          return const ScaffoldPage(
            header: PageHeader(title: Text('Hymns')),
            content: Center(child: Text('No hymns found')),
          );
        }
        return ScaffoldPage.scrollable(
          header: PageHeader(
            title: const Text('Hymns'),
            commandBar: CommandBar(
              primaryItems: [
                CommandBarButton(
                  icon: const Icon(FluentIcons.archive),
                  label: const Text('Archive'),
                  onPressed: () {},
                ),
                CommandBarButton(
                  icon: const Icon(FluentIcons.move),
                  label: const Text('Move'),
                  onPressed: () {},
                ),

                // HymnDownloadButton(hymnId: widget.hymn.id),
              ],
            ),
          ),
          children: List.generate(
            sorted.value.length,
            (index) {
              final result = sorted.value[index];
              return ListTile(
                title: Text(result.title),
                subtitle: Text(result.number),
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => HymnDetails(hymn: result),
                //   ),
                // ),
                onPressed: () {
                  context.push('/library/hymns/${result.id}');
                },
              );
            },
          ),
        );
      });
    }
    return const ScaffoldPage(
      header: PageHeader(title: Text('Hymns')),
      content: Center(child: ProgressRing()),
    );
  }
}

enum HymnSortField {
  title,
  number,
}
