import 'package:areadr/configs/themes/theme_service.dart';
import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/cores/constants/images.dart';
import 'package:areadr/cores/widgets/custom_buttons.dart';
import 'package:areadr/cores/widgets/custom_carousel.dart';
import 'package:areadr/cores/widgets/custom_progress_indicator.dart';
import 'package:areadr/cores/widgets/custom_snackbar.dart';
import 'package:areadr/layers/blocs/cubits/auth_cubit.dart';
import 'package:areadr/layers/blocs/states/auth_states.dart';
import 'package:areadr/layers/presentation/signing_proceed_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;

  Future<void> _proceedSigning(bool isNewLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('newLogin', isNewLogin);
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.40, // Half the screen height
        child: SigningProceedScreen(isNewLogin: isNewLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.I<ThemeService>();
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  const CustomProgressIndicator();
                }
                if (state is AuthSuccess) {
                  // Navigate to the next screen on successful login
                  Navigator.pushNamed(context, '/home');
                } else if (state is AuthFailure) {
                  // Show error message
                  CustomSnackbar.showSnackbar(
                    context: context,
                    message: "Login Failure!",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    icon: Icons.check_circle,
                  );
                }
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomTextButton(
                          onPressed: () {
                            themeService.toggleTheme();
                          },
                          text: 'Skip',
                        ),
                      ),
                      const Expanded(
                          flex: 1, // Adjust flex for 50% of screen height
                          child: CustomCarousel(
                            imagePaths: [
                              Images.firstImage,
                              Images.secondImage,
                              Images.thirdImage,
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
                                CustomBackgroundButton(
                                  onPressed: () => _proceedSigning(true),
                                  text: 'Get Started Now',
                                ),
                                CustomOutlinedButton(
                                  onPressed: () => _proceedSigning(false),
                                  text: 'Log In',
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text:
                                            "By logging in, you acknowledge and accept our ",
                                      ),
                                      TextSpan(
                                        text: "Terms",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,

                                          color: AppColors
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
                                          color: AppColors
                                              .black, // Black color for clickable text
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Navigate to Privacy Policy
                                          },
                                      ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
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
          ),
        ));
  }
}
