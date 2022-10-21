import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'di/di.dart';

void main() {
  ServiceLocatorImp.I.setupLocator();
  runApp(const AppWidget());
}
