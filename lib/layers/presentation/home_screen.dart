import 'package:areadr/configs/localizations/localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization!.translate('appTitle')),
      ),
      body: Center(
        child: Text(
          localization.translate('welcomeMessage'),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
