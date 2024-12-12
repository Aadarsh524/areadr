import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/cores/constants/fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData customLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 24,
      ),
      labelLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 24,
      ),
      headlineMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 18,
      ),
      labelMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 18,
      ),
      headlineSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
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
  static final ThemeData customDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 24,
      ),
      labelLarge: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 24,
      ),
      headlineMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 18,
      ),
      labelMedium: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.secondary,
        fontSize: 18,
      ),
      headlineSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.white,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.primary,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
        color: AppColors.black,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontFamily: CustomFonts.customFontFamily,
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
