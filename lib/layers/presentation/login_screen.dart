import 'package:areadr/configs/themes/theme_service.dart';
import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/cores/widgets/custom_carousel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;

  Future<void> _saveNewLoginStatus(bool isNewLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('newLogin', isNewLogin);
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.40, // Half the screen height
        child: GoogleSignInScreen(isNewLogin: isNewLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.I<ThemeService>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      themeService.toggleTheme();
                    },
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const Expanded(
                    flex: 1, // Adjust flex for 50% of screen height
                    child: CustomCarousel(
                      imagePaths: [
                        'assets/images/first.png',
                        'assets/images/second.png',
                        'assets/images/third.png'
                      ],
                    )),

                // Horizontal Silver Line Separator
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 1,
                    color: AppColors.secondary, // Silver line color
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              _saveNewLoginStatus(true);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0), // Adjust padding as needed
                              foregroundColor: AppColors.white, // Text color
                              backgroundColor:
                                  AppColors.primary, // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                            ),
                            child: Text(
                              "Get Started Now",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              _saveNewLoginStatus(false);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: AppColors.secondary,
                                  width: 2), // Border with primary color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0,
                                  horizontal: 30.0), // Adjust padding as needed
                            ),
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                color: AppColors
                                    .primary, // Text color to match the border
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 8),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: AppColors.secondary,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text:
                                      "By logging in, you acknowledge and accept our ",
                                ),
                                TextSpan(
                                  text: "Terms",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,

                                    color: Colors
                                        .black, // Black color for clickable text
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to Terms and Conditions
                                    },
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black, // Black color for clickable text
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to Privacy Policy
                                    },
                                ),
                                const TextSpan(text: "."),
                              ],
                            ),
                          )),

                      // Terms and conditions text, placed just below the buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),

                            // App Title with a responsive font size
                            Text(
                              "Audio delivery of news",
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Skip Button positioned at the top-right corner
          ],
        ),
      ),
    );
  }
}

class GoogleSignInScreen extends StatelessWidget {
  final bool isNewLogin;

  const GoogleSignInScreen({super.key, required this.isNewLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag indicator
          Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Title
          Text(
            isNewLogin ? "Create an Account" : "Welcome Back",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Subtitle
          const Text(
            "Discover the world of Areadr and stay updated with the latest news.",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              // Add Google Sign-In logic here
            },
            icon: Image.asset(
              'assets/images/google.png',
              height: 24,
              width: 24,
            ),
            label: const Text(
              "Sign In with Google",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              backgroundColor: AppColors.primary, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
            ),
          ),

          const SizedBox(height: 20),
          // Footer text with navigation
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              children: [
                TextSpan(
                  text: isNewLogin
                      ? "Already have an account? "
                      : "Don't have an account? ",
                ),
                TextSpan(
                  text: isNewLogin ? "Log In" : "Create",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to the respective screen
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
