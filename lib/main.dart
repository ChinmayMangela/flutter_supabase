import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/theme/app_theme.dart';
import 'package:flutter_supabase/features/auth/presentation/screens/sign_in_and_sign_up.dart';

void main() {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      theme: AppTheme.theme,
      home: SignInAndSignUp(),
    ));
  }
}
