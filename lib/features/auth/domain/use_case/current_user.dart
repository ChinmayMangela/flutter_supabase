

import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<EndUser?, NoParams>{
  final AuthRepository _authRepository;

  const CurrentUser(this._authRepository);

  @override
  Future<Either<Failure, EndUser?>> call(NoParams param) async {
    return await _authRepository.getCurrentUserData();
  }
}