import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/features/auth/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/nutrition_card.dart';

class NutritionalFactsComponent extends StatelessWidget {
  const NutritionalFactsComponent({
    super.key,
    required this.quantity,
    required this.nutrients,
  });

  final String quantity;
  final List<Map<String, String>> nutrients;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeading(
            heading: AppStrings.ingredientScanner.nutritionalFactsHeading,
          ),
          const SizedBox(height: 7),
          Text('Per $quantity', style: TextThemes(context).labelSmall.copyWith(
            color: AppColors.greyColor
          ),),
          const SizedBox(height: 13),
          _buildNutritionGrid()
        ],
      ),
    );
  }

  Widget _buildNutritionGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13
      ),
      itemCount: nutrients.length,
      itemBuilder: (context, index) {
        return NutritionCard(
          label: nutrients[index]["label"] ?? '',
          value: nutrients[index]['value'] ?? '',
        );
      },
    );
  }
}
