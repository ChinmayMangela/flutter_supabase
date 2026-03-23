import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/red_flag_ingredient_card.dart';

class RedFlagIngredientsComponent extends StatelessWidget {
  const RedFlagIngredientsComponent({
    super.key,
    required this.redFlagIngredients,
  });

  final List<Map<String, String>> redFlagIngredients;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(AppIcons.home.warning),
              SizedBox(width: 5),
              CustomHeading(
                heading: AppStrings.ingredientScanner.redFlagIngredientsHeading,
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: redFlagIngredients.length,
            itemBuilder: (context, index) {
              return RedFlagIngredientCard(
                ingredientName: redFlagIngredients[index]['ingredient_name'] ?? '',
                riskLevel: redFlagIngredients[index]['risk_level'] ?? '',
                primaryHealthImpact: redFlagIngredients[index]['primary_health_impact'] ?? '',
                clinicalMechanism: redFlagIngredients[index]['clinical_mechanism'] ?? '',
                detailedDescription: redFlagIngredients[index]['detailed_description'] ?? '',
              );
            },
          ),
        ],
      ),
    );
  }
}
