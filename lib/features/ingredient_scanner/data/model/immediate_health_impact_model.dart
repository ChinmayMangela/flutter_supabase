import 'package:flutter_supabase/core/constants/health_score_defaults.dart';
import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/immediate_health_impact.dart';

class ImmediateHealthImpactModel extends ImmediateHealthImpact {
  const ImmediateHealthImpactModel({
    required super.impactLabel,
    required super.impactDescription,
  });

  factory ImmediateHealthImpactModel.fromJson(Map<String, dynamic> json) {
    return ImmediateHealthImpactModel(
      impactLabel: SafeJson.toStringValue(
        json['impact_label'],
        defaultValue: HealthScoreDefaults.notAvailableNutritionalFact,
      ),
      impactDescription: SafeJson.toStringValue(
        json['impact_description'],
        defaultValue: HealthScoreDefaults.notAvailableNutritionalFact,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'impact_label': impactLabel,
      'impact_description': impactDescription
    };
  }
}
