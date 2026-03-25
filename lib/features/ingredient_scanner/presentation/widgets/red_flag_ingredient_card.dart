import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/red_flag_ingredient.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/dimen.dart';

class RedFlagIngredientCard extends StatelessWidget {
  const RedFlagIngredientCard({
    super.key,
    required this.ingredientName,
    required this.riskLevel,
    required this.primaryHealthImpact,
    required this.clinicalMechanism,
    required this.detailedDescription,
  });

  final String ingredientName;
  final RiskLevel riskLevel;
  final String primaryHealthImpact;
  final String clinicalMechanism;
  final String detailedDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: CustomPadding.cardPadding,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.buttonRadius,
        color: AppColors.cardGrayColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndLevel(context),
          const SizedBox(height: 4),
          Text(
            primaryHealthImpact,
            style: TextThemes(
              context,
            ).bodySmall.copyWith(color: AppColors.greyColor),
          ),
          const SizedBox(height: 10),
          _buildClinicalMechanismComponentWithDescription(context)
        ],
      ),
    );
  }

  Widget _buildNameAndLevel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ingredientName,
          style: TextThemes(
            context,
          ).bodyLarge.copyWith(fontWeight: TextWeight.w500),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: CustomRadius.buttonRadius,
            color: AppColors.black,
          ),
          child: Text(
            riskLevel.name,
            style: TextThemes(
              context,
            ).labelSmall.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildClinicalMechanismComponentWithDescription(BuildContext context) {
    return Container(
      padding: CustomPadding.cardPadding,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.buttonRadius,
        border: Border.all(color: AppColors.black.withValues(alpha: 0.1))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(AppIcons.home.bolt, color: AppColors.black),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  clinicalMechanism,
                  style: TextThemes(context).bodyMedium.copyWith(
                    fontWeight: TextWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),
          Text(detailedDescription, style: TextThemes(context).labelMedium.copyWith(
            color: AppColors.greyColor
          ),)
        ],
      ),
    );
  }
}
