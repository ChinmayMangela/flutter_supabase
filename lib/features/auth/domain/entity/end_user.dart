import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, name, email, password];

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
    );
  }
}
