import 'package:flutter/material.dart';

class ThemeService {
  // Default theme mode
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  // Switch between light and dark theme
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  // Get the corresponding ThemeData for the active ThemeMode
  ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: Colors.blueAccent,
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
      );
}
