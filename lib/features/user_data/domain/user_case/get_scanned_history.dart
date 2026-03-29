

import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetScannedHistory implements UseCase<List<HealthAnalysis>, GetScannedHistoryParams>{
  final EndUserRepository endUserRepository;

  const GetScannedHistory(this.endUserRepository);

  @override
  Future<Either<Failure, List<HealthAnalysis>>> call(GetScannedHistoryParams param) async {
    return await endUserRepository.getPreviouslyScannedData(userId: param.userId);
  }

}

class GetScannedHistoryParams {
  final String userId;

  const GetScannedHistoryParams(this.userId);
}