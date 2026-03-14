import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/current_user.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/reset_password.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_in.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_out.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_up.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;
  final CurrentUser currentUser;
  final ResetPassword resetPassword;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
    required this.currentUser,
    required this.resetPassword,
  }) : super(AuthInitial()) {
    on<AuthSignUpRequested>(_onAuthSignUpRequested);
    on<AuthSignInRequested>(_onAuthSignInRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
    on<AuthSendResetPasswordEmailRequested>(
      _onAuthSendResetPasswordEmailRequested,
    );
    on<AuthStatusCheckRequested>(_onAuthStatusCheckRequested);
  }

  Future<void> _onAuthSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signUp(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onAuthSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signIn(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signOut(NoParams());

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(UnAuthenticated()),
    );
  }

  Future<void> _onAuthSendResetPasswordEmailRequested(
    AuthSendResetPasswordEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await resetPassword(
      ResetPasswordMailParams(email: event.email),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(
        PasswordResetSuccess('Password reset mail has been sent to your email'),
      ),
    );
  }

  Future<void> _onAuthStatusCheckRequested(
    AuthStatusCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await currentUser(NoParams());

    result.fold((failure) => emit(UnAuthenticated()), (user) {
      if (user == null) {
        emit(UnAuthenticated());
      } else {
        emit(AuthSuccess(user));
      }
    });
  }
}
