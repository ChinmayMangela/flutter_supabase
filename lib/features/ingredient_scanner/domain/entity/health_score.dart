import 'package:equatable/equatable.dart';

class HealthScore extends Equatable {
  final double rating;
  final String healthDescription;

  const HealthScore({required this.rating, required this.healthDescription});

  @override
  List<Object?> get props => [rating, healthDescription];
}
