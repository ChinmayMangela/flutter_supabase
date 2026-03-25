import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/ai_deep_analysis_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_score_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/immediate_health_impact_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/nutritional_facts_component.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/red_flag_ingredients_component.dart';

class IngredientAnalysisScreen extends StatefulWidget {
  const IngredientAnalysisScreen({super.key, required this.healthAnalysis});

  final HealthAnalysis healthAnalysis;

  @override
  State<IngredientAnalysisScreen> createState() =>
      _IngredientAnalysisScreenState();
}

class _IngredientAnalysisScreenState extends State<IngredientAnalysisScreen> {
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
    final healthScore = widget.healthAnalysis.healthScore;
    final rating = healthScore.rating;
    final aiDescription = healthScore.healthDescription;
    return HealthScoreComponent(rating: rating, aiDescription: aiDescription);
  }

  Widget _buildNutritionalFactsComponent() {
    final nutritionalFacts = widget.healthAnalysis.nutritionalFacts;
    final quantity = "${nutritionalFacts.productQuantity}${nutritionalFacts.quantityMeasure}";
    final facts = nutritionalFacts.facts;
    return NutritionalFactsComponent(quantity: quantity, facts: facts);
  }

  Widget _buildImmediateHealthImpactsComponent() {
    final immediateHealthImpacts = widget.healthAnalysis.immediateImpacts;
    return ImmediateHealthImpactComponent(healthImpacts: immediateHealthImpacts);
  }

  Widget _buildRedFlagIngredientsComponent() {
    final redFlagIngredients = widget.healthAnalysis.redFlagIngredients;
    return RedFlagIngredientsComponent(redFlagIngredients: redFlagIngredients);
  }

  Widget _buildHealthierAlternativesComponent() {
    final aiDeepAnalysis = widget.healthAnalysis.aiDeepAnalysis;
    final healthierAlternatives = widget.healthAnalysis.healthierAlternatives;
    return AiDeepAnalysisComponent(
      analysis: aiDeepAnalysis,
      healthierAlternatives: healthierAlternatives,
    );
  }
}
