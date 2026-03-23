import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';

class AiDeepAnalysisComponent extends StatelessWidget {
  const AiDeepAnalysisComponent({
    super.key,
    required this.analysis,
    required this.healthierAlternatives,
  });

  final String analysis;
  final List<String> healthierAlternatives;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: AppColors.black,
      child: Column(
        children: [
          Row(
            children: [
              Icon(AppIcons.home.aiIcon, color: AppColors.white),
              const SizedBox(width: 4),
              CustomHeading(
                heading: AppStrings.ingredientScanner.aiDeepAnalysisHeading,
                textColor: AppColors.white,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            analysis,
            style: TextThemes(
              context,
            ).bodySmall.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 15),
          Divider(color: AppColors.gray),
          const SizedBox(height: 15),
          _buildHealthierAlternativesComponent()
        ],
      ),
    );
  }

  Widget _buildHealthierAlternativesComponent() {
    return Column(
      children: [
        Row(
          children: [
            Icon(AppIcons.home.shield, color: AppColors.white),
            const SizedBox(width: 4),
            CustomHeading(
              heading:
                  AppStrings.ingredientScanner.healthierAlternativesHeading,
              textColor: AppColors.white,
            ),
          ],
        ),
        const SizedBox(height: 4),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: healthierAlternatives.length,
          itemBuilder: (context, index) {
            return _buildAlternativeTile(index, healthierAlternatives[index], context);
          },
        ),
      ],
    );
  }

  Widget _buildAlternativeTile(int index, String name, BuildContext context) {
    return ListTile(
      leading: Icon(AppIcons.home.bulletPoint, color: AppColors.white, size: 12,),
      title: Text(
        name,
        style: TextThemes(context).labelMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}
