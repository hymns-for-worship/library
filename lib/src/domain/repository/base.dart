import 'dart:async';

import '../../data/signals/signal.dart';

abstract class BaseRepository<T, V> extends Signal<List<T>> {
  BaseRepository(super.value);

  FutureOr<int> add(V item) async {
    final items = await addAll([item]);
    return items.first;
  }

  FutureOr<void> refresh() async => value = await getAll();

  FutureOr<int> count();

  FutureOr<void> createTable();
  
  FutureOr<void> createTriggers();

  FutureOr<List<T>> getAll();

  FutureOr<T?> getById(int id);

  FutureOr<List<int>> addAll(List<V> items);

  FutureOr<void> deleteById(int id);

  FutureOr<void> delete(V item);

  FutureOr<void> deleteAll();
}
