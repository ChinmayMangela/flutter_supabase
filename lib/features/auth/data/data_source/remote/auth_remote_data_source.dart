import 'dart:io';

import 'package:flutter_supabase/features/auth/data/model/end_user_model.dart';
import 'package:flutter_supabase/features/auth/domain/exception/app_auth_exception.dart';
import 'package:flutter_supabase/features/auth/domain/exception/auth_exception_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Stream<EndUserModel?> get userSession;

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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _client;

  const AuthRemoteDataSourceImpl(this._client);

  @override
  Stream<EndUserModel?> get userSession =>
      _client.auth.onAuthStateChange.map((data) {
        final user = data.session?.user;

        if (user == null) {
          return null;
        } else {
          return _mapToModel(user);
        }
      });

  @override
  Future<EndUserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _handleException(() async {
      final authResponse = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = authResponse.user;
      if (user == null || authResponse.session == null) {
        throw AppAuthException('Sign In failed', code: 'null-user');
      }

      return _mapToModel(user);
    });
  }

  @override
  Future<EndUserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _handleException(() async {
      final authResponse = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final user = authResponse.user;
      if (user == null || authResponse.session == null) {
        throw AppAuthException('Sign up failed', code: 'null-user');
      }

      return _mapToModel(user);
    });
  }

  @override
  Future<void> signOut() async {
    return await _handleException(() async {
      await _client.auth.signOut();
    });
  }

  @override
  Future<void> sendPasswordResetMail({required String email}) async {
    return await _handleException(() async {
      await _client.auth.resetPasswordForEmail(email);
    });
  }

  @override
  Future<EndUserModel?> getCurrentUserData() async {
    return await _handleException(() async {
      final user = _client.auth.currentUser;
      if (user == null) {
        return null;
      }

      return _mapToModel(user);
    });
  }

  EndUserModel _mapToModel(User user) {
    return EndUserModel(
      id: user.id,
      name: user.userMetadata?['name'] as String? ?? 'Unknown',
      email: user.email ?? '',
      createdAt: DateTime.tryParse(user.createdAt) ?? DateTime.now(),
    );
  }

  Future<T> _handleException<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on AuthException catch (e) {
      throw AuthExceptionMapper.mapSupabaseAuthException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }
}
