import 'package:flutter/material.dart';

import 'features/login/login.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.deepPurpleAccent,
          onPrimary: Colors.deepPurpleAccent,
          secondary: Colors.black,
          onSecondary: Colors.black87,
          error: Colors.red[900] ?? Colors.red,
          onError: Colors.red[900] ?? Colors.red,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.deepPurple,
          outline: Colors.black87,
          tertiary: Colors.grey,
          surfaceTint: Colors.deepPurpleAccent,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent
        ),
        scaffoldBackgroundColor: Colors.blueGrey[50],
      ),
      home: const LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginScreen(),
      },
      initialRoute: '/login',
    );
}