import 'package:areadr/configs/localizations/localization_delegates.dart';
import 'package:areadr/configs/routes.dart';
import 'package:areadr/configs/themes/theme_service.dart';
import 'package:areadr/configs/themes/themes.dart';
import 'package:areadr/firebase_options.dart';
import 'package:areadr/layers/blocs/cubits/auth_cubit.dart';
import 'package:areadr/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerLazySingleton(() => const AppLocalizationDelegate());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();

  final themeService = GetIt.I<ThemeService>();
  await themeService.loadThemeMode(); // Load saved theme mode

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.I<ThemeService>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeService.themeNotifier,
        builder: (context, themeMode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'appTitle',
            theme: AppThemes.customLightTheme,
            darkTheme: AppThemes.customDarkTheme,
            themeMode: themeMode,
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
      ),
    );
  }
}
