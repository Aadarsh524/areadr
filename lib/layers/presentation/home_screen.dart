import 'package:areadr/configs/localizations/localization.dart';
import 'package:areadr/layers/blocs/cubits/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalization.of(context);

    User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization!.translate('appTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localization.translate('welcomeMessage $currentUser'),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Sign out logic here
                BlocProvider.of<AuthCubit>(context).signOut();
              },
              child: Text(localization.translate('signOut')),
            ),
          ],
        ),
      ),
    );
  }
}
