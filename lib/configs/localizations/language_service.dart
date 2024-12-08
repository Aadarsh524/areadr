import 'package:areadr/configs/localizations/localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LanguageService {
  Locale _currentLocale = const Locale('en'); // Default locale

  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale locale) {
    _currentLocale = locale;
    GetIt.I<AppLocalization>().load(); // Reload localization
  }
}
