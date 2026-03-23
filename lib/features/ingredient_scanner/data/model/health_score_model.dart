import 'package:flutter_supabase/core/constants/health_score_defaults.dart';
import 'package:flutter_supabase/core/utils/safe_json.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_score.dart';

class HealthScoreModel extends HealthScore {
  const HealthScoreModel({
    required super.rating,
    required super.healthDescription,
  });

  factory HealthScoreModel.fromJson(Map<String, dynamic> json) {
    return HealthScoreModel(
      rating: SafeJson.toDouble(json['rating']),
      healthDescription: SafeJson.toStringValue(
        json['health_description'],
        defaultValue: HealthScoreDefaults.notAvailableNutritionalFact,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'rating': rating, 'health_description': healthDescription};
  }
}
