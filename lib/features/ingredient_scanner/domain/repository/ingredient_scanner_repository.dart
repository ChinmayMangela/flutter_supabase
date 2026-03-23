

import 'package:camera/camera.dart';
import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IngredientScannerRepository {
  Future<Either<Failure, HealthAnalysis>> scanIngredients(XFile file);
}