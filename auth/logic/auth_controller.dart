import 'package:flutter/material.dart';

class AuthController {
  // Email validation
  FormFieldValidator<String> validateEmail = (value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  };

  // Username validation
  FormFieldValidator<String> validateUsername = (value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    }
    if (value.length < 3) {
      return "Username must be at least 3 characters";
    }
    return null;
  };

  // Password validation
  FormFieldValidator<String> validatePassword = (value) {
    if (value == null || value.isEmpty) {
      return "Enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  };

  // Confirm Password validation
  FormFieldValidator<String> confirmPassword(String password) {
    return (value) {
      if (value == null || value.isEmpty) {
        return "Confirm your password";
      }
      if (value != password) {
        return "Passwords don't match";
      }
      return null;
    };
  }
}
