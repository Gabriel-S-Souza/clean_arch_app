import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'di/di.dart';
import 'domain/domain.dart';

void main() async {
  await ServiceLocatorImp.I.setupLocator();
  final loginUseCase = ServiceLocatorImp.I.get<LoginUseCase>();

  final response2 = await loginUseCase.getUser();
  response2.fold(
    (l) => print(l.message),
    (r) => print(r.name),
  );

  runApp(const AppWidget());
}
