import 'dart:async';
import 'dart:io';

import 'package:pocketbase/pocketbase.dart';
import 'package:retry/retry.dart';

Future<T> retryFuture<T>(Future<T> Function() callback) async {
  return await retry(
    () => callback().timeout(const Duration(minutes: 5)),
    retryIf: (e) {
      print('error retry: $e');
      return e is SocketException || e is TimeoutException || (e is ClientException && e.statusCode != 404);
    },
  );
}
