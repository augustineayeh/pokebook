import 'package:flutter/material.dart';

import 'app.dart';
import 'core/service_locator/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}
