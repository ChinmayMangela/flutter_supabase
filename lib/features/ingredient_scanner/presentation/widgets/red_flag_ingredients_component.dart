import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/red_flag_ingredient.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/red_flag_ingredient_card.dart';

class RedFlagIngredientsComponent extends StatelessWidget {
  const RedFlagIngredientsComponent({
    super.key,
    required this.redFlagIngredients,
  });

  final List<RedFlagIngredient> redFlagIngredients;

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
              Expanded(
                child: CustomHeading(
                  heading: AppStrings.ingredientScanner.redFlagIngredientsHeading,
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: redFlagIngredients.length,
            itemBuilder: (context, index) {
              return RedFlagIngredientCard(
                ingredientName: redFlagIngredients[index].ingredientName,
                riskLevel: redFlagIngredients[index].riskLevel,
                primaryHealthImpact: redFlagIngredients[index].primaryHealthImpact,
                clinicalMechanism: redFlagIngredients[index].clinicalMechanism,
                detailedDescription: redFlagIngredients[index].detailedDescription,
              );
            },
          ),
        ],
      ),
    );
  }
}
