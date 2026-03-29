import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveScannedData implements UseCase<void, ScannedDataParams> {
  final EndUserRepository endUserRepository;

  const SaveScannedData(this.endUserRepository);

  @override
  Future<Either<Failure, void>> call(ScannedDataParams param) async {
    return await endUserRepository.saveScannedData(
      healthAnalysis: param.healthAnalysis,
    );
  }
}

class ScannedDataParams {
  final HealthAnalysis healthAnalysis;

  const ScannedDataParams(this.healthAnalysis);
}
