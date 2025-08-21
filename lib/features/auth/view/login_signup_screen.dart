import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/button_effect.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              "booky",
              style: TextStyle(
                fontSize: 66,
                fontStyle: FontStyle.italic,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your book library\nat the office",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 40),

            // Log in Button
            SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.activeButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, buttonEffectRoute(const Login()));
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Sign up Button
            SizedBox(
              width: 200,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.activeButton,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, buttonEffectRoute(const SignUp()));
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 16, color: Color(0xFF4CAF87)),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Bottom img
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset("assets/images/img2.png", width: 350),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
