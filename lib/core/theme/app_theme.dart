


import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: CustomRadius.buttonRadius
      )
    )
  );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.black
    ),
  );
}