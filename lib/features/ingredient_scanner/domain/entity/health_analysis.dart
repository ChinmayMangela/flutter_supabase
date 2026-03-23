

import 'package:equatable/equatable.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_score.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/immediate_health_impact.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/nutritional_facts.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/red_flag_ingredient.dart';


class HealthAnalysis extends Equatable {
  final HealthScore healthScore;
  final NutritionalFacts nutritionalFacts;
  final List<ImmediateHealthImpact> immediateImpacts;
  final List<RedFlagIngredient> redFlagIngredients;
  final String aiDeepAnalysis;
  final List<String> healthierAlternatives;

  const HealthAnalysis({
    required this.healthScore,
    required this.nutritionalFacts,
    required this.immediateImpacts,
    required this.redFlagIngredients,
    required this.aiDeepAnalysis,
    required this.healthierAlternatives,
  });

  @override
  List<Object?> get props => [
    healthScore,
    nutritionalFacts,
    immediateImpacts,
    redFlagIngredients,
    aiDeepAnalysis,
    healthierAlternatives,
  ];
}