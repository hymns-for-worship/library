import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import 'details.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Hymns')),
      body: Watch(
        (context) => items.value.map(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text(
            'Error loading hymns: $error\n$stackTrace',
          ),
          data: (results) {
            if (results.isEmpty) {
              return const Center(child: Text('No hymns found'));
            }
            return Column(
              children: [
                Watch(
                  (context) => Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: DropdownButton(
                          value: sortField.value,
                          items: [
                            for (final item in HymnSortField.values)
                              DropdownMenuItem(
                                value: item,
                                child: Text(item.name),
                              ),
                          ],
                          onChanged: (val) => sortField.value = val!,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButton(
                          value: sortAsc.value,
                          items: [
                            for (final item in [true, false])
                              DropdownMenuItem(
                                value: item,
                                child: Text(item.toString()),
                              ),
                          ],
                          onChanged: (val) => sortAsc.value = val!,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sorted.value.length,
                    itemBuilder: (context, index) {
                      final result = sorted.value[index];
                      return ListTile(
                        title: Text(result.title),
                        subtitle: Text(result.number),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HymnDetails(hymn: result),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum HymnSortField {
  title,
  number,
}
