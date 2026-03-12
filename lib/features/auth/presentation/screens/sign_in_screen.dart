import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_description.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;

  void _togglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  String? _validateEmail(String? value) {
    return HelperFunctions.emailValidator(value);
  }

  String? _validatePassword(String? value) {
    return HelperFunctions.passwordValidator(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppIcon(),
              SizedBox(height: screenHeight * 0.05),
              CustomHeading(heading: AppStrings.auth.signInHeading),
              SizedBox(height: screenHeight * 0.01),
              CustomDescription(description: AppStrings.auth.signInDescription),
              _buildEmailField(),
              SizedBox(height: screenHeight * 0.01),
              _buildPasswordField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppIcon() {
    return Container(
      padding: CustomPadding.iconPadding,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.iconRadius,
        color: AppColors.black,
      ),
      child: Image.asset('assets/images/app_icon.png', height: 30),
    );
  }

  Widget _buildEmailField() {
    return AuthTextField(
      controller: _emailController,
      hintText: 'Email',
      fieldName: 'Email',
      obscure: false,
      validator: _validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return AuthTextField(
      controller: _passwordController,
      hintText: 'Password',
      fieldName: 'Password',
      obscure: _obscurePassword,
      togglePasswordState: _togglePasswordState,
      validator: _validatePassword,
    );
  }
}
