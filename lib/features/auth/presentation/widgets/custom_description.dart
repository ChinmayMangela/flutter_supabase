import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextThemes(context).bodyMedium.copyWith(
      color: AppColors.grey
    ),);
  }
}
