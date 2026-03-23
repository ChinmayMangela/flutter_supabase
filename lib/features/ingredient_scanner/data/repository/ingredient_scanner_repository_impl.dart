

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/remote/ingredient_scanner_remote_data_source.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/repository/ingredient_scanner_repository.dart';
import 'package:fpdart/fpdart.dart';

class IngredientScannerRepositoryImpl implements IngredientScannerRepository {
  final IngredientScannerRemoteDataSource ingredientScannerRemoteDataSource;
  const IngredientScannerRepositoryImpl(this.ingredientScannerRemoteDataSource);

  @override
  Future<Either<Failure, HealthAnalysis>> scanIngredients(XFile file) async {
    try {
      final result = await ingredientScannerRemoteDataSource.scanIngredients(file);
      return right(result);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}