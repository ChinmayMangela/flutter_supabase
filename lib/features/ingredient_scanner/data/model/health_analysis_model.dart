import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_score_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/immediate_health_impact_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/nutritional_facts_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/red_flag_ingredient_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';

class HealthAnalysisModel extends HealthAnalysis {
  const HealthAnalysisModel({
    required super.healthScore,
    required super.nutritionalFacts,
    required super.immediateImpacts,
    required super.aiDeepAnalysis,
    required super.healthierAlternatives,
    required super.redFlagIngredients,
  });

  factory HealthAnalysisModel.fromJson(Map<String, dynamic> json) {
    return HealthAnalysisModel(
      healthScore: HealthScoreModel.fromJson(json['health_score']),
      nutritionalFacts: NutritionalFactsModel.fromJson(
        json['nutritional_facts'],
      ),
      immediateImpacts: SafeJson.toList(
        json['immediate_health_impact'],
        (item) => ImmediateHealthImpactModel.fromJson(item),
      ),
      aiDeepAnalysis: SafeJson.toStringValue(json['ai_deep_analysis']),
      healthierAlternatives: SafeJson.toList(
        json['healthier_alternatives'],
        (item) => item.toString(),
      ),
      redFlagIngredients: SafeJson.toList(
        json['red_flag_ingredients'],
        (item) => RedFlagIngredientModel.fromJson(item),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'health_score': (healthScore as HealthScoreModel).toJson(),
      'nutritional_facts': (nutritionalFacts as NutritionalFactsModel).toJson(),
      'immediate_health_impact': immediateImpacts
          .map((e) => (e as ImmediateHealthImpactModel).toJson())
          .toList(),
      'ai_deep_analysis': aiDeepAnalysis,
      'healthier_alternatives': healthierAlternatives
          .map((e) => e.toString())
          .toList(),
      'red_flag_ingredients': redFlagIngredients
          .map((e) => (e as RedFlagIngredientModel).toJson())
          .toList(),
    };
  }
}
