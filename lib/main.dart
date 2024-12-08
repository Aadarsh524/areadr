import 'package:areadr/configs/localizations/localization_delegates.dart';
import 'package:areadr/configs/routes.dart';
import 'package:areadr/configs/themes/theme_service.dart';
import 'package:areadr/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton(() => ThemeService());
  getIt.registerLazySingleton(() => const AppLocalizationDelegate());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Track theme mode
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.I<ThemeService>();

    return AnimatedBuilder(
      animation: ValueNotifier(themeService.themeMode),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'appTitle',
          theme: themeService.lightTheme,
          darkTheme: themeService.darkTheme,
          themeMode: themeService.themeMode,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
          ],
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const SplashScreen(),
        );
      },
    );
  }
}
