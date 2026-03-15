import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.isFridgeVisionFeatureCard,
    required this.onTap,
  });

  final bool isFridgeVisionFeatureCard;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final homeString = AppStrings.home;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: HelperFunctions.getScreenWidth(context),
        padding: CustomPadding.cardPadding,
        decoration: BoxDecoration(borderRadius: CustomRadius.buttonRadius, color: AppColors.gray.withValues(alpha: 0.16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(7)
              ),
              child: Image.asset(
                isFridgeVisionFeatureCard
                    ? 'assets/images/fridge.png'
                    : 'assets/images/scanner.png',
                color: AppColors.white,
                height: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              isFridgeVisionFeatureCard
                  ? homeString.fridgeVisionHeading
                  : homeString.ingredientScannerHeading,
              style: TextThemes(context).headlineMedium.copyWith(
                fontWeight: TextWeight.w900
              ),
            ),
            SizedBox(height: 10),
            Text(
              isFridgeVisionFeatureCard
                  ? homeString.fridgeVisionDescription
                  : homeString.ingredientScannerDescription,
              style: TextThemes(context).bodyMedium.copyWith(
                color: AppColors.black.withValues(alpha: 0.5)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
