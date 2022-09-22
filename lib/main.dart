import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  ServiceLocator.setUpDependencies();
  runApp(const AppWidget());
}