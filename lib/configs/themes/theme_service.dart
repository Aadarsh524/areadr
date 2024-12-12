import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final ValueNotifier<ThemeMode> _themeNotifier =
      ValueNotifier(ThemeMode.light);
  ValueNotifier<ThemeMode> get themeNotifier => _themeNotifier;

  ThemeMode get themeMode => _themeNotifier.value;

  void toggleTheme() {
    _themeNotifier.value = _themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    saveThemeMode(_themeNotifier.value);
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("themeMode", themeMode.name);
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString("themeMode") ?? ThemeMode.system.name;
    _themeNotifier.value =
        ThemeMode.values.firstWhere((e) => e.name == themeName);
  }
}
