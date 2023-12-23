import 'package:flutter/material.dart';

import 'app.dart';
import 'instance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const HfwCoreApp());
}
