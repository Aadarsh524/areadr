import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/cores/constants/fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 20,
      ),
      labelLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 20,
      ),
      headlineMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 12,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme with custom font
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 24,
      ),
      labelLarge: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 24,
      ),
      headlineMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.white,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.black,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontFamily: Fonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 12,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
