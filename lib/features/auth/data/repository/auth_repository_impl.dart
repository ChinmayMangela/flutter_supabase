import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/auth/domain/exception/app_auth_exception.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, EndUser?>> getCurrentUserData() {
    return _handleException(() => _authRemoteDataSource.getCurrentUserData());
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetMail({required String email}) {
    return _handleException(
      () => _authRemoteDataSource.sendPasswordResetMail(email: email),
    );
  }

  @override
  Future<Either<Failure, EndUser>> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _handleException(
      () => _authRemoteDataSource.signInWithEmail(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> signOut() {
    return _handleException(() => _authRemoteDataSource.signOut());
  }

  @override
  Future<Either<Failure, EndUser>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) {
    return _handleException(
      () => _authRemoteDataSource.signUpWithEmail(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  @override
  Stream<EndUser?> get userSession => _authRemoteDataSource.userSession;

  Future<Either<Failure, T>> _handleException<T>(
    Future<T> Function() action,
  ) async {
    try {
      return right(await action());
    } on AppAuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
