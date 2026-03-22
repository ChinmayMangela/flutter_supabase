import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';

class HealthScoreComponent extends StatefulWidget {
  const HealthScoreComponent({
    super.key,
    required this.rating,
    required this.aiDescription,
  });

  final double rating;
  final String aiDescription;

  @override
  State<HealthScoreComponent> createState() => _HealthScoreComponentState();
}

class _HealthScoreComponentState extends State<HealthScoreComponent> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildHeadingAndDescription(), _buildRatingComponent()],
          ),
          const SizedBox(height: 15),
          _buildAIDescriptionComponent(context),
        ],
      ),
    );
  }

  Widget _buildHeadingAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.ingredientScanner.healthScoreHeading, style: TextThemes(context).headlineMedium.copyWith(
          fontWeight: TextWeight.w900
        ),),
        const SizedBox(height: 5),
        Text(AppStrings.ingredientScanner.healthScoreDescription, style: TextThemes(context).bodyMedium.copyWith(
          color: AppColors.greyColor
        ),),
      ],
    );
  }

  Widget _buildRatingComponent() {
    return Container(
      padding: CustomPadding.cardPadding,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
      child: Column(children: [Text(widget.rating.toString(), style: TextThemes(context).headlineSmall.copyWith(
        color: AppColors.white,
        fontWeight: TextWeight.w900
      ),), Text('/10', style: TextThemes(context).bodyMedium.copyWith(
        color: AppColors.gray
      ),)]),
    );
  }

  Widget _buildAIDescriptionComponent(BuildContext context) {
    return Container(
      width: HelperFunctions.getScreenWidth(context),
      padding: CustomPadding.screenPadding,
      decoration: BoxDecoration(borderRadius: CustomRadius.buttonRadius, color: AppColors.cardGrayColor),
      child: Text(widget.aiDescription),
    );
  }
}
