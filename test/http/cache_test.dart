import 'dart:convert';

import 'package:drift/native.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final inner = TestHttpClient();
  final database = HfwDatabase(NativeDatabase.memory());
  final store = DatabaseHttpStore(database);
  final client = HttpGetCache(
    inner: inner,
    store: store,
  );
  const base = 'http:localhost:8080';
  final uri = Uri.parse(base);

  group('HttpGetCache', () {
    setUp(() => inner.count = 0);

    tearDown(() async {
      await store.clear();
    });

    test('check if response if returned normal from inner', () async {
      final res = await client.inner.get(uri);
      expect(res.statusCode, 200);
      expect(res.headers['Content-Type'], 'application/json');
    });

    test('check if response if returned normal', () async {
      final res = await client.get(uri);
      expect(res.statusCode, 200);
      expect(res.headers['Content-Type'], 'application/json');
    });

    group('check repeated calls', () {
      test('check 3 tries with cache control of max age 10', () async {
        // Set cache control header
        inner.headers[client.cacheControlKey] = 'max-age=10';
        var res = await client.get(uri);

        expect(res.statusCode, 200);
        expect(res.headers['Content-Type'], 'application/json');
        expect(inner.count, 1);
        expect(res.headers[client.cacheControlKey], 'max-age=10');

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(res.headers['Content-Type'], 'application/json');
        expect(inner.count, 1);
        expect(res.headers[client.cacheControlKey], 'max-age=10');

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(res.headers['Content-Type'], 'application/json');
        expect(inner.count, 1);
        expect(res.headers[client.cacheControlKey], 'max-age=10');
      });

      test('check 3 tries with cache control of max age 3 with delay',
          () async {
        // Set cache control header
        inner.headers[client.cacheControlKey] = 'max-age=3';
        var res = await client.get(uri);

        expect(res.statusCode, 200);
        expect(inner.count, 1);

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 1);

        await Future.delayed(const Duration(seconds: 4));

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 2);

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 2);
      });

      test('check that cache is not saved on error', () async {
        // Set cache control header
        inner.headers[client.cacheControlKey] = 'max-age=3';
        inner.error = true;
        var res = await client.get(uri);

        expect(res.statusCode, 500);
        expect(inner.count, 0);

        res = await client.get(uri);

        expect(res.statusCode, 500);
        expect(inner.count, 0);

        inner.error = false;

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 1);

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 1);
      });
    });
    group('Cache-Control header overrides', () {
      test('missing', () async {
        inner.headers.remove(client.cacheControlKey);
        var res = await client.get(uri);

        expect(res.statusCode, 200);
        expect(inner.count, 1);

        res = await client.get(uri);
        expect(res.statusCode, 200);
        expect(inner.count, 2);
      });

      test('max-age', () async {
        inner.headers.remove(client.cacheControlKey);
        var res = await client.get(uri, headers: {
          client.cacheControlKey: 'max-age=10',
        });

        expect(res.statusCode, 200);
        expect(inner.count, 1);

        res = await client.get(uri, headers: {
          client.cacheControlKey: 'max-age=10',
        });
        expect(res.statusCode, 200);
        expect(inner.count, 1);
      });
    });
  });
}

class TestHttpClient extends BaseClient {
  final headers = <String, String>{};
  int count = 0;
  bool error = false;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (error) {
      return StreamedResponse(
        Stream.value(utf8.encode(jsonEncode({'error': 'test error'}))),
        500,
        headers: {'Content-Type': 'application/json'},
      );
    }
    count++;
    return json({'count': count});
  }

  StreamedResponse json(Map<String, dynamic> data) {
    return StreamedResponse(
      Stream.value(utf8.encode(jsonEncode(data))),
      200,
      headers: {
        ...headers,
        'Content-Type': 'application/json',
      },
    );
  }
}
