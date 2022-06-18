import 'package:animal_detection/app.dart';
import 'package:flutter/material.dart';

import 'app/dependencies.locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(const MyApp());
}
