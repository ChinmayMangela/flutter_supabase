import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onTap, required this.child});

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: HelperFunctions.getScreenWidth(context),
        height: HelperFunctions.getScreenHeight(context) * 0.064,
        child: ElevatedButton(onPressed: onTap, child: child));
  }
}
