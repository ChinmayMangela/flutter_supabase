import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_analysis_model.dart';

import '../../../auth/data/model/end_user_model.dart';
import '../../../auth/domain/entity/end_user.dart';

class Mapper {
  const Mapper._();

  static EndUser toEntity(EndUserModel model) {
    return EndUser(
      id: model.id,
      name: model.name,
      email: model.email,
      createdAt: model.createdAt,
    );
  }

  static EndUserModel toModel(EndUser entity) {
    return EndUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      createdAt: entity.createdAt,
    );
  }

  static HealthAnalysisModel toHealthAnalysisEntity(HealthAnalysisModel model) {
    return HealthAnalysisModel(
      healthScore: model.healthScore,
      nutritionalFacts: model.nutritionalFacts,
      immediateImpacts: model.immediateImpacts,
      aiDeepAnalysis: model.aiDeepAnalysis,
      healthierAlternatives: model.healthierAlternatives,
      redFlagIngredients: model.redFlagIngredients,
    );
  }
}
