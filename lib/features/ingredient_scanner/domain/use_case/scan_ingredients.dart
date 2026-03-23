


import 'package:camera/camera.dart';
import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/repository/ingredient_scanner_repository.dart';
import 'package:fpdart/fpdart.dart';

class ScanIngredients implements UseCase<HealthAnalysis, ScanIngredientParams>{
  final IngredientScannerRepository ingredientScannerRepository;

  const ScanIngredients(this.ingredientScannerRepository);
  @override
  Future<Either<Failure, HealthAnalysis>> call(ScanIngredientParams param) async {
    return await ingredientScannerRepository.scanIngredients(param.file);
  }

}

class ScanIngredientParams {
  final XFile file;

  const ScanIngredientParams({required this.file});
}