


import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class EndUserRepository {
  Future<Either<Failure, void>> saveUser({required EndUser user});
  Future<Either<Failure, EndUser>> getUserData();
  Future<Either<Failure, List<HealthAnalysis>>> getPreviouslyScannedData({required String userId});
}