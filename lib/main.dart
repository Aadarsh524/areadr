import 'package:areadr/configs/localizations/localization_delegates.dart';
import 'package:areadr/configs/routes.dart';
import 'package:areadr/configs/themes/theme_service.dart';
import 'package:areadr/configs/themes/themes.dart';
import 'package:areadr/dashboard_screen.dart';
import 'package:areadr/features/feed/cubit/feed_cubit.dart';
import 'package:areadr/features/authentication/presentation/login_screen.dart';
import 'package:areadr/firebase_options.dart';
import 'package:areadr/features/authentication/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  await Firebase.initializeApp();

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
        BlocProvider(
          create: (context) => FeedNewsCubit(),
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
            home: _buildHome(),
          );
        },
      ),
    );
  }
}

/// Check user authentication status
Widget _buildHome() {
  final user = FirebaseAuth.instance.currentUser; // Check the current user
  if (user != null) {
    return const DashboardScreen(); // User is logged in
  } else {
    return const LoginScreen(); // User not logged in
  }
}
