import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/view/login_signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginSignUpScreen()),
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.splashGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 80),
            const Text(
              "booky",
              style: TextStyle(fontSize: 66, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset("assets/images/img1.png", width: 220),
            ),
          ],
        ),
      ),
    );
  }
}
