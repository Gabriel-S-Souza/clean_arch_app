import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  ServiceLocatorImp.I.setupLocator();
  runApp(const AppWidget());
}
