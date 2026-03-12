import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/bottom_message.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_description.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.signInTap});

  final void Function() signInTap;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordState() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  String? _validateName(String? value) {
    return HelperFunctions.nameValidator(value);
  }

  String? _validateEmail(String? value) {
    return HelperFunctions.emailValidator(value);
  }

  String? _validatePassword(String? value) {
    return HelperFunctions.passwordValidator(value);
  }

  String? _validateConfirmPassword(String? value) {
    return HelperFunctions.confirmPasswordValidator(
      value,
      _passwordController.text.trim(),
    );
  }

  void _onSignUpTap() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAppIcon(),
                SizedBox(height: screenHeight * 0.05),
                CustomHeading(heading: AppStrings.auth.signUpHeading),
                SizedBox(height: screenHeight * 0.01),
                CustomDescription(
                  description: AppStrings.auth.signUpDescription,
                ),
                SizedBox(height: screenHeight * 0.05),
                _buildNameField(),
                SizedBox(height: screenHeight * 0.01),
                _buildEmailField(),
                SizedBox(height: screenHeight * 0.01),
                _buildPasswordField(),
                SizedBox(height: screenHeight * 0.01),
                _buildConfirmPasswordField(),
                SizedBox(height: screenHeight * 0.02),
                _buildSignUpButton(),
                SizedBox(height: screenHeight * 0.02),
                _buildBottomMessage(),
              ],
            ),
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

  Widget _buildNameField() {
    return AuthTextField(
      controller: _nameController,
      hintText: 'Name',
      fieldName: 'Name',
      obscure: false,
      validator: _validateName,
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

  Widget _buildConfirmPasswordField() {
    return AuthTextField(
      controller: _confirmPasswordController,
      hintText: 'Confirm Password',
      fieldName: 'Password',
      obscure: _obscureConfirmPassword,
      togglePasswordState: _toggleConfirmPasswordState,
      validator: _validateConfirmPassword,
    );
  }

  Widget _buildSignUpButton() {
    return AuthButton(
      onTap: _onSignUpTap,
      child: Text(
        AppStrings.auth.signUpLabel,
        style: TextThemes(context).labelMedium.copyWith(
          color: AppColors.white,
          fontWeight: TextWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBottomMessage() {
    return BottomMessage(
      bottomMessage: AppStrings.auth.signUpBottomMessage,
      authLabel: AppStrings.auth.signInLabel,
      onTap: widget.signInTap,
    );
  }
}
