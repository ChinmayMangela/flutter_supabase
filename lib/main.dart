import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/theme/app_theme.dart';
import 'package:flutter_supabase/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:flutter_supabase/features/auth/presentation/screens/sign_in_and_sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fclyeyxmzvlohvbjuouc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjbHlleXhtenZsb2h2Ymp1b3VjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM0MjQyOTIsImV4cCI6MjA4OTAwMDI5Mn0.qhZI7F4koZfJCODh_SlvpLhA0p1t_lWOQeJ6ictaYEM',
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        routes: _routes,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: messengerKey,
        theme: AppTheme.theme,
        home: SignInAndSignUp(),
      ),
    );
  }

  Map<String, WidgetBuilder> get _routes => {
    '/forgotPassword': (context) => ForgotPasswordScreen(),
  };
}
