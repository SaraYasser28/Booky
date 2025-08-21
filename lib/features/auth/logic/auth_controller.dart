import 'package:flutter/material.dart';

class AuthController {
  // Email validation
  FormFieldValidator<String> validateEmail = (value) {
    if (value == null || value.isEmpty) {
      return "Enter your email";
    }
    if (!value.contains("@")) {
      return "Enter a valid email";
    }
    return null;
  };

  // Username validation
  FormFieldValidator<String> validateUsername = (value) {
    if (value == null || value.isEmpty) {
      return "Enter your username";
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
