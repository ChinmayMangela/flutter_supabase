import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_score_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/nutritional_facts_component.dart';

class IngredientAnalysisScreen extends StatefulWidget {
  const IngredientAnalysisScreen({super.key});

  @override
  State<IngredientAnalysisScreen> createState() =>
      _IngredientAnalysisScreenState();
}

class _IngredientAnalysisScreenState extends State<IngredientAnalysisScreen> {
  final rating = 3.0;
  final aiDescription = AppStrings.ingredientScanner.dummyText;
  final List<Map<String, String>> nutrients = [
    {'label': 'Calories', 'value': '240'},
    {'label': 'Sugar', 'value': '65g'},
    {'label': 'Carbs', 'value': '67g'},
    {'label': 'Sodium', 'value': '55mg'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: SingleChildScrollView(child: Column(children: [
        _buildHealthScoreComponent(),
        SizedBox(height: screenHeight * 0.02),
        _buildNutritionalFactsComponent()
      ])),
    );
  }

  Widget _buildHealthScoreComponent() {
    return HealthScoreComponent(rating: rating, aiDescription: aiDescription);
  }

  Widget _buildNutritionalFactsComponent() {
    return NutritionalFactsComponent(quantity: '255 ml', nutrients: nutrients);
  }
}
