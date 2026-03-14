
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final EndUser endUser;

  const AuthSuccess(this.endUser);

  @override
  List<Object?> get props => [endUser];
}

class AuthFailure extends AuthState {
  final String errorMessage;

  const AuthFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}

class PasswordResetSuccess extends AuthState {
  final String message;

  const PasswordResetSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PasswordResetFailure extends AuthState {
  final String errorMessage;

  const PasswordResetFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}