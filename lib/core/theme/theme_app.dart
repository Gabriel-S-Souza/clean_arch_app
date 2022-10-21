import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
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
        centerTitle: true, backgroundColor: Colors.deepPurpleAccent),
    scaffoldBackgroundColor: Colors.blueGrey[50],
  );
}
