


import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: _elevatedButtonTheme
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightGreen
    )
  );
}