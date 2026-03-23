

import 'package:camera/camera.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_analysis_model.dart';

abstract interface class IngredientScannerRemoteDataSource {
  Future<HealthAnalysisModel> scanIngredients(XFile file);
}

