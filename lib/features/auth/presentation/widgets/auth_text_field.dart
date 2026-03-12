import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.fieldName,
    required this.obscure,
    this.togglePasswordState,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String fieldName;
  final bool obscure;
  final void Function()? togglePasswordState;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.gray.withValues(alpha: 0.24),
        border: _buildBorder(false),
        focusedBorder: _buildBorder(true),
        enabledBorder: _buildBorder(false),
        suffixIcon: _buildSuffixIcon(),
        prefixIcon: _buildPrefixIcon(),
      ),
    );
  }

  OutlineInputBorder _buildBorder(bool isEnabled) {
    return OutlineInputBorder(
      borderRadius: CustomRadius.buttonRadius,
      borderSide: isEnabled
          ? BorderSide(color: AppColors.black, width: 1.3)
          : BorderSide.none,
    );
  }

  Widget? _buildSuffixIcon() {
    return fieldName == 'Password'
        ? IconButton(
            onPressed: togglePasswordState,
            icon: Icon(
              obscure ? AppIcons.auth.visibility : AppIcons.auth.visibilityOff,
            ),
          )
        : null;
  }

  Widget _buildPrefixIcon() {
    if (fieldName == 'Email') {
      return Icon(AppIcons.auth.email);
    } else if (fieldName == 'Password') {
      return Icon(AppIcons.auth.password);
    } else {
      return Icon(AppIcons.auth.name);
    }
  }
}
