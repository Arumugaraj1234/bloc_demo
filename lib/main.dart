import 'package:flutter/material.dart';
import 'package:unit_test_app/core/app.dart';
import 'package:unit_test_app/core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  runApp(const MyApp());
}
