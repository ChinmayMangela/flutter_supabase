import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignIn implements UseCase<EndUser, SignInParams> {
  final AuthRepository _authRepository;

  const SignIn(this._authRepository);

  @override
  Future<Either<Failure, EndUser>> call(SignInParams param) async {
    return await _authRepository.signInWithEmail(
      email: param.email,
      password: param.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}
