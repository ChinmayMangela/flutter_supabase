import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';

class EndUserModel extends EndUser {
  const EndUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.createdAt,
  });

  factory EndUserModel.fromJson(Map<String, dynamic> json) {
    return EndUserModel(
      id: json['id'],
      name: json['name'] as String? ?? 'unknown',
      email: json['email'] as String? ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
