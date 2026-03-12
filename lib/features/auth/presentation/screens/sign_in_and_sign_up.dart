import 'package:flutter/material.dart';
import 'package:flutter_supabase/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_supabase/features/auth/presentation/screens/sign_up_screen.dart';

class SignInAndSignUp extends StatefulWidget {
  const SignInAndSignUp({super.key});

  @override
  State<SignInAndSignUp> createState() => _SignInAndSignUpState();
}

class _SignInAndSignUpState extends State<SignInAndSignUp> {
  bool _showSignInScreen = true;

  void _toggleScreens() {
    setState(() {
      _showSignInScreen = !_showSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showSignInScreen
        ? SignInScreen(signUpTap: _toggleScreens)
        : SignUpScreen(signInTap: _toggleScreens);
  }
}
