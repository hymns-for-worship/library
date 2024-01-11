import 'dart:async';

// ignore: avoid_web_libraries_in_flutter

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'package:sqlite3/wasm.dart';

DatabaseConnection connect(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
  bool debug = false,
}) {
  return DatabaseConnection.delayed(Future(() async {
    final sqliteUrl = Uri.parse('/sqlite3.${debug ? 'debug.' : ''}wasm');
    if (inMemory) {
      final sqlite = await WasmSqlite3.loadFromUrl(sqliteUrl);
      return DatabaseConnection(
        WasmDatabase.inMemory(
          sqlite,
          logStatements: logStatements,
        ),
      );
    }
    final result = await WasmDatabase.open(
      // prefer to only use valid identifiers here
      databaseName: dbName.replaceAll('.db', ''),
      sqlite3Uri: sqliteUrl,
      driftWorkerUri: Uri.parse('/drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      // Depending how central local persistence is to your app, you may want
      // to show a warning to the user if only unreliable implementations
      // are available.
      if (kDebugMode) {
        print(
          'Using ${result.chosenImplementation} due to missing browser '
          'features: ${result.missingFeatures}',
        );
      }
    }

    return result.resolvedExecutor;
  }));
}
