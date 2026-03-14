import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUp implements UseCase<EndUser, SignUpParams> {
  final AuthRepository _authRepository;

  const SignUp(this._authRepository);

  @override
  Future<Either<Failure, EndUser>> call(SignUpParams param) async {
    return await _authRepository.signUpWithEmail(
      name: param.name,
      email: param.email,
      password: param.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
