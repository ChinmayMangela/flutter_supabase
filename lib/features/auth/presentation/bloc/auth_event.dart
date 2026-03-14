import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSignUpRequested({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInRequested({required this.email, required this.password});
}

class AuthSignOutRequested extends AuthEvent {}

class AuthSendResetPasswordEmailRequested extends AuthEvent {
  final String email;

  const AuthSendResetPasswordEmailRequested({required this.email});
}


class AuthStatusCheckRequested extends AuthEvent {}