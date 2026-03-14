import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt
  });

  @override
  List<Object?> get props => [id, name, email, password, createdAt];

  EndUser copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return EndUser(
      id: this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt
    );
  }
}
