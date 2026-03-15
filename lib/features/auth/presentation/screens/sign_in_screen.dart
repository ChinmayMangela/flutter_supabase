import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/bottom_message.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_description.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.signUpTap});

  final void Function() signUpTap;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  void _onForgotPasswordTap() {
    Navigator.of(context).pushNamed('/forgotPassword');
  }

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

  void _onSignInTap() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      context.read<AuthBloc>().add(
        AuthSignInRequested(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/home', (route) => false);
        } else if (state is AuthFailure) {
          HelperFunctions.showSnackBar(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(body: _buildBody(state));
      },
    );
  }

  Widget _buildBody(AuthState state) {
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
                CustomHeading(heading: AppStrings.auth.signInHeading),
                SizedBox(height: screenHeight * 0.01),
                CustomDescription(
                  description: AppStrings.auth.signInDescription,
                ),
                SizedBox(height: screenHeight * 0.05),
                _buildEmailField(),
                SizedBox(height: screenHeight * 0.01),
                _buildPasswordField(),
                SizedBox(height: screenHeight * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_buildForgotPasswordButton()],
                ),
                SizedBox(height: screenHeight * 0.005),
                _buildSignInButton(state),
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

  Widget _buildSignInButton(AuthState state) {
    return AuthButton(
      onTap: _onSignInTap,
      child: state is AuthLoading
          ? SizedBox(height: 25, width: 25, child: CircularProgressIndicator(color: AppColors.white,))
          : Text(
              AppStrings.auth.signInLabel,
              style: TextThemes(context).labelMedium.copyWith(
                color: AppColors.white,
                fontWeight: TextWeight.w500,
              ),
            ),
    );
  }

  Widget _buildBottomMessage() {
    return BottomMessage(
      bottomMessage: AppStrings.auth.signInBottomMessage,
      authLabel: AppStrings.auth.signUpLabel,
      onTap: widget.signUpTap,
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: _onForgotPasswordTap,
      child: Text(AppStrings.auth.forgotPassword),
    );
  }
}
