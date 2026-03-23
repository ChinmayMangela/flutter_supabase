import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/red_flag_ingredient.dart';

class RedFlagIngredientModel extends RedFlagIngredient {
  const RedFlagIngredientModel({
    required super.ingredientName,
    required super.primaryHealthImpact,
    required super.clinicalMechanism,
    required super.detailedDescription,
    required super.riskLevel,
  });

  factory RedFlagIngredientModel.fromJson(Map<String, dynamic> json) {
    return RedFlagIngredientModel(
      ingredientName: SafeJson.toStringValue(json['ingredient_name']),
      primaryHealthImpact: SafeJson.toStringValue(
        json['primary_health_impact'],
      ),
      clinicalMechanism: SafeJson.toStringValue(json['clinical_mechanism']),
      detailedDescription: SafeJson.toStringValue(json['detailed_description']),
      riskLevel: SafeJson.fromString(json['risk_type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient_name': ingredientName,
      'primary_health_impact': primaryHealthImpact,
      'clinical_mechanism': clinicalMechanism,
      'detailed_description': detailedDescription,
      'risk_type': riskLevel.toString().split('.').last,
    };
  }

}
