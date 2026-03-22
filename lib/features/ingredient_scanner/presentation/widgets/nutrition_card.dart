import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPadding.cardPadding,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.buttonRadius,
        color: AppColors.cardGrayColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: TextThemes(context).headlineMedium.copyWith(
            fontWeight: TextWeight.w900
          ),),
          const SizedBox(height: 6),
          Text(label, style: TextThemes(context).bodyMedium.copyWith(
            color: AppColors.black.withValues(alpha: 0.4)
          ),)
        ],
      ),
    );
  }
}
