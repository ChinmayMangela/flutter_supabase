import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/auth/data/model/end_user_model.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/user_data/data/mapper/mapper.dart';
import 'package:flutter_supabase/features/user_data/data/remote/end_user_remote_data_source.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EndUserRepositoryImpl implements EndUserRepository {
  final EndUserRemoteDataSource endUserRemoteDataSource;

  const EndUserRepositoryImpl(this.endUserRemoteDataSource);

  @override
  Future<Either<Failure, List<HealthAnalysis>>> getPreviouslyScannedData({
    required String userId,
  }) async {
    return _handleException(() async {
      final models = await endUserRemoteDataSource.getPreviouslyScannedData(userId: userId);
      return models.map((model) => Mapper.toHealthAnalysisEntity(model)).toList();
    });
  }

  @override
  Future<Either<Failure, EndUser>> getUserData() async {
    return await _handleException(() async {
      final model = await endUserRemoteDataSource.getUserData();
      return Mapper.toEntity(model);
    });
  }

  @override
  Future<Either<Failure, void>> saveUser({required EndUser user}) async {
    return await _handleException(
      () async => await endUserRemoteDataSource.saveUser(
        user: EndUserModel.fromEntity(user),
      ),
    );
  }

  Future<Either<Failure, T>> _handleException<T>(
    Future<T> Function() call,
  ) async {
    try {
      return right(await call());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveScannedData({
    required HealthAnalysis healthAnalysis
}) {
    // TODO: implement saveScannedData
    throw UnimplementedError();
  }
}
