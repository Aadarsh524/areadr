import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    _checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Centering the image at the top of the screen
          Center(
            child: Image.asset(
              'assets/images/logo.png', // Replace with your image path
              height: 160, // Adjust height as needed
              width: 160, // Adjust width as needed
            ),
          ),
          // Positioned text at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 50.0), // Adjust this value for better spacing
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: Text(
                  'Areadr',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _checkLoginStatus(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;

    // Wait for 3 seconds and navigate based on authentication status
    Future.delayed(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }
}
