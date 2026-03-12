import 'package:flutter/material.dart';
import 'package:flutter_supabase/main.dart';

class HelperFunctions {
  const HelperFunctions._();

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showSnackBar(String? message) {
    if (message == null) return;
    final SnackBar snackBar = SnackBar(content: Text(message));
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters";
    }
    if (value.length > 20) {
      return "Name must be less than 20 characters";
    }
    return null;
  }


  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty!";
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }
}
