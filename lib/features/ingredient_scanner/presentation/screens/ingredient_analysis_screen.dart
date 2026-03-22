import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_score_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/immediate_health_impact_component.dart';
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
  final List<Map<String, String>> _nutrients = [
    {'label': 'Calories', 'value': '240'},
    {'label': 'Sugar', 'value': '65g'},
    {'label': 'Carbs', 'value': '67g'},
    {'label': 'Sodium', 'value': '55mg'},
  ];

  final List<Map<String, String>> _healthImpact = [
    {'impact_label': 'Blood Sugar Spike', 'impact_description': '65g of sugar causes rapid insulin response and energy crash'},
    {'impact_label': 'Empty Calories', 'impact_description': 'Zero nutritional value - no vitamins, minerals, or fiber'},
    {'impact_label': 'Weakened Immunity', 'impact_description': 'High sugar intake suppresses immune system for hours'},
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
        _buildNutritionalFactsComponent(),
        SizedBox(height: screenHeight * 0.02),
        _buildImmediateHealthImpactsComponent()
      ])),
    );
  }

  Widget _buildHealthScoreComponent() {
    return HealthScoreComponent(rating: rating, aiDescription: aiDescription);
  }

  Widget _buildNutritionalFactsComponent() {
    return NutritionalFactsComponent(quantity: '255 ml', nutrients: _nutrients);
  }

  Widget _buildImmediateHealthImpactsComponent() {
    return ImmediateHealthImpactComponent(healthImpact: _healthImpact);
  }
}
