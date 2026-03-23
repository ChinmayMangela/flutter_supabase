import 'package:flutter_supabase/core/constants/health_score_defaults.dart';
import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/nutritional_fact.dart';

class NutritionalFactModel extends NutritionalFact {
  const NutritionalFactModel({required super.label, required super.value});

  factory NutritionalFactModel.fromJson(Map<String, dynamic> json) {
    return NutritionalFactModel(
      label: SafeJson.toStringValue(
        json['label'],
        defaultValue: HealthScoreDefaults.notAvailableNutritionalFact,
      ),
      value: SafeJson.toStringValue(
        json['value'],
        defaultValue: HealthScoreDefaults.notAvailableNutritionalFact,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value};
  }
}
