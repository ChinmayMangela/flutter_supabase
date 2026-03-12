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
}
