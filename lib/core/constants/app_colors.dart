import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color inactiveButton = Color(0xFFAFDFC7);
  static const Color activeButton = Color(0xFF5ABD8C);
  static const Color primary = Color(0xFF5ABD8C);
  static const Color secondary = Color.fromARGB(255, 112, 112, 112);

  static const LinearGradient splashGradient = LinearGradient(
    colors: [inactiveButton, activeButton],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
