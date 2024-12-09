import 'package:areadr/cores/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            onPressed: () {},
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
                            onPressed: () {},
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
}
