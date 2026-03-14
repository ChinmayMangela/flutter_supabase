import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt
  });

  @override
  List<Object?> get props => [id, name, email, createdAt];

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
      createdAt: createdAt
    );
  }
}
