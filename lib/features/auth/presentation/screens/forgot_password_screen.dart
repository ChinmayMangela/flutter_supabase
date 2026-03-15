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
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    return HelperFunctions.emailValidator(value);
  }

  void _onForgotPasswordTap() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      context.read<AuthBloc>().add(
        AuthSendResetPasswordEmailRequested(email: email),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PasswordResetSuccess) {
            HelperFunctions.showSnackBar(state.message);
          } else if (state is PasswordResetFailure) {
            HelperFunctions.showSnackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(AuthState state) {
    final height = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomHeading(heading: AppStrings.auth.forgotPassword),
                SizedBox(height: height * 0.06),
                _buildEmailField(),
                SizedBox(height: height * 0.02),
                _buildForgotPasswordButton(state),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildForgotPasswordButton(AuthState state) {
    return AuthButton(
      onTap: _onForgotPasswordTap,
      child: state is AuthLoading
          ? SizedBox(height: 25, width: 25, child: CircularProgressIndicator(
        color: AppColors.white,
      ))
          : Text(AppStrings.auth.forgotPassword),
    );
  }
}
