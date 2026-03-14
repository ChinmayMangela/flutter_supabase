

import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignOut implements UseCase<void, NoParams>{
  final AuthRepository _authRepository;

  const SignOut(this._authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams param) async {
    return await _authRepository.signOut();
  }


}