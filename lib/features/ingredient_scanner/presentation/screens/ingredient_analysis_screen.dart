import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/ai_deep_analysis_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_score_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/immediate_health_impact_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/nutritional_facts_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/red_flag_ingredients_component.dart';

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
    {
      'impact_label': 'Blood Sugar Spike',
      'impact_description':
          '65g of sugar causes rapid insulin response and energy crash',
    },
    {
      'impact_label': 'Empty Calories',
      'impact_description':
          'Zero nutritional value - no vitamins, minerals, or fiber',
    },
    {
      'impact_label': 'Weakened Immunity',
      'impact_description':
          'High sugar intake suppresses immune system for hours',
    },
  ];

  final List<Map<String, String>> _redFlagIngredients = [
    {
      'ingredient_name': 'High Fructose Corn Syrup',
      'risk_level': 'High Risk',
      'primary_health_impact': 'Linked to obesity and diabetes',
      'clinical_mechanism': 'Metabolic Dysfunction',
      'detailed_description':
          'This highly processed sweetener bypasses normal metabolic regulation, leading to increased fat storage and insulin resistance. Studies show a strong correlation with type 2 diabetes and non-alcoholic fatty liver disease.',
    },
    {
      'ingredient_name': 'Palm Oil',
      'risk_level': 'Medium Risk',
      'primary_health_impact': 'High in saturated fats, environmental concerns',
      'clinical_mechanism': 'Cardiovascular Risk',
      'detailed_description':
          'Contains 50% saturated fat which can raise LDL cholesterol levels. Mass production contributes to deforestation and habitat destruction. Consider alternatives like olive or avocado oil.',
    },
    {
      'ingredient_name': 'Artificial Colors (Red 40)',
      'risk_level': 'High Risk',
      'primary_health_impact': 'Potential behavioral issues in children',
      'clinical_mechanism': 'Neurotoxicity',
      'detailed_description':
          'Petroleum-based synthetic dye linked to hyperactivity, attention problems, and allergic reactions. Banned in several European countries. May contain carcinogenic contaminants from manufacturing.',
    },
    {
      'ingredient_name': 'Sodium Benzoate',
      'risk_level': 'Medium Risk',
      'primary_health_impact': 'May form benzene when combined with vitamin C',
      'clinical_mechanism': 'Carcinogenic Potential',
      'detailed_description':
          'When combined with ascorbic acid (vitamin C) in acidic conditions, can form benzene - a known carcinogen. Also linked to DNA damage and mitochondrial dysfunction in cells.',
    },
  ];

  final List<String> _healthierAlternatives = [
    'Sparkling water with fresh fruit slices',
    'Unsweetened iced tea with lemon',
    'Kombucha (naturally fermented tea)',
    'Coconut water with no added sugar',
  ];

  final String _analysis =
      'This product contains several highly processed ingredients that may negatively impact your health. High fructose corn syrup is a refined sweetener linked to increased risk of metabolic syndrome, insulin resistance, and non-alcoholic fatty liver disease.\n\nThe presence of artificial colors and preservatives suggests heavy industrial processing. These synthetic additives offer no nutritional value and may trigger inflammatory responses in sensitive individuals. Red 40, in particular, has been associated with behavioral changes in children and is banned in several European countries.\n\nWith 65 grams of sugar per serving, this product contains more than double the recommended daily intake of added sugars. Regular consumption significantly increases risk of obesity, type 2 diabetes, heart disease, and dental problems.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHealthScoreComponent(),
            SizedBox(height: screenHeight * 0.02),
            _buildNutritionalFactsComponent(),
            SizedBox(height: screenHeight * 0.02),
            _buildImmediateHealthImpactsComponent(),
            SizedBox(height: screenHeight * 0.02),
            _buildRedFlagIngredientsComponent(),
            SizedBox(height: screenHeight * 0.02),
            _buildHealthierAlternativesComponent(),
          ],
        ),
      ),
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

  Widget _buildRedFlagIngredientsComponent() {
    return RedFlagIngredientsComponent(redFlagIngredients: _redFlagIngredients);
  }

  Widget _buildHealthierAlternativesComponent() {
    return AiDeepAnalysisComponent(
      analysis: _analysis,
      healthierAlternatives: _healthierAlternatives,
    );
  }
}
