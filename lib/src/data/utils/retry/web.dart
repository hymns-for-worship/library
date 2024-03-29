import 'dart:async';

import 'package:pocketbase/pocketbase.dart';
import 'package:retry/retry.dart';

Future<T> retryFuture<T>(Future<T> Function() callback) async {
  return await retry(
    () => callback().timeout(const Duration(minutes: 5)),
    retryIf: (e) =>
        e is TimeoutException || (e is ClientException && e.statusCode != 404),
  );
}
