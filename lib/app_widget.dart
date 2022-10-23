import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/login/login.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeApp.theme,
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginScreen(),
          '/profile': (BuildContext context) => const ProfileScreen(),
        },
        initialRoute: '/login',
      );
}
