

import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ResetPassword implements UseCase<void, ResetPasswordMailParams>{
  final AuthRepository _authRepository;

  const ResetPassword(this._authRepository);

  @override
  Future<Either<Failure, void>> call(ResetPasswordMailParams param) {
    return _authRepository.sendPasswordResetMail(email: param.email);
  }
}


class ResetPasswordMailParams {
  final String email;

  const ResetPasswordMailParams({required this.email});
}