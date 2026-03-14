import 'package:flutter_supabase/features/auth/data/model/end_user_model.dart';

abstract interface class AuthRemoteDataSource {
  Stream<EndUserModel> get userStream;

  Future<EndUserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<EndUserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> sendPasswordResetMail({required String email});

  Future<EndUserModel?> getCurrentUserData();
}
