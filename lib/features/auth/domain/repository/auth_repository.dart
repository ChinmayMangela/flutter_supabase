import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Stream<EndUser?> get userSession;

  Future<Either<Failure, EndUser>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, EndUser>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> sendPasswordResetMail({required String email});

  Future<Either<Failure, EndUser?>> getCurrentUserData();
}
