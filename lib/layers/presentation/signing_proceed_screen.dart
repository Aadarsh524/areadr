import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/cores/constants/images.dart';
import 'package:areadr/cores/widgets/custom_buttons.dart';
import 'package:areadr/layers/blocs/cubits/auth_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigningProceedScreen extends StatefulWidget {
  final bool isNewLogin;

  const SigningProceedScreen({super.key, required this.isNewLogin});

  @override
  State<SigningProceedScreen> createState() => _SigningProceedScreenState();
}

class _SigningProceedScreenState extends State<SigningProceedScreen> {
  late bool _isNewLogin;

  @override
  void initState() {
    super.initState();
    _isNewLogin = widget.isNewLogin;
  }

  void _toggleLoginState() {
    setState(() {
      _isNewLogin = !_isNewLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
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
            _isNewLogin ? "Create an Account" : "Welcome Back", // Fixed
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          // Subtitle
          Text(
            "Discover the world of Areadr and stay updated with the latest news.",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),

          // Google Sign In Button
          CustomElevatedIconButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).signInWithGoogle(_isNewLogin);
            },
            labelText: "Sign In with Google",
            iconPath: Images.googleImage, // Replace with your image path
          ),

          const SizedBox(height: 20),
          // Footer text with navigation
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.labelSmall,
              children: [
                TextSpan(
                  text: _isNewLogin // Fixed
                      ? "Already have an account? "
                      : "Don't have an account? ",
                ),
                TextSpan(
                  text: _isNewLogin // Fixed
                      ? "Log In"
                      : "Create",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _toggleLoginState();
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
