import 'package:areadr/cores/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent for rounded corners
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.40, // Half the screen height
        child: GoogleSignInScreen(isNewLogin: isNewLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Add skip action, for example navigate to the next screen
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // Adjust flex for 50% of screen height
                  child: CarouselSlider(
                    items: [
                      buildCarouselImage("assets/images/first.png"),
                      buildCarouselImage("assets/images/second.png"),
                      buildCarouselImage("assets/images/third.png"),
                    ],
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      autoPlay: true,
                      height: double.infinity,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      aspectRatio:
                          16 / 9, // Maintain aspect ratio for responsiveness
                      enableInfiniteScroll:
                          true, // Infinite scrolling of images
                      autoPlayInterval:
                          const Duration(seconds: 3), // Auto play interval
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child:
                      DotsIndicator(currentIndex: currentIndex, totalDots: 3),
                ),

                // Horizontal Silver Line Separator
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
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
                            child: const Text(
                              "Get Started Now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
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
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    0.07, // Adjust text size based on screen width
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
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

Widget buildCarouselImage(String imagePath) {
  return Container(
    height: 250, // Increased height for better visibility
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.totalDots,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8,
          width: index == currentIndex ? 12 : 8,
          decoration: BoxDecoration(
            color: index == currentIndex ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
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
            label: const Padding(
              padding: EdgeInsets.only(
                  left: 30), // Adds padding to the left of the text
              child: Text(
                "Sign In with Google",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
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
