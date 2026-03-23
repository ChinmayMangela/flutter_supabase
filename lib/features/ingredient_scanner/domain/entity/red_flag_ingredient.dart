import 'package:equatable/equatable.dart';

class RedFlagIngredient extends Equatable {
  final String ingredientName;
  final String primaryHealthImpact;
  final String clinicalMechanism;
  final String detailedDescription;
  final RiskLevel riskLevel;

  const RedFlagIngredient({
    required this.ingredientName,
    required this.primaryHealthImpact,
    required this.clinicalMechanism,
    required this.detailedDescription,
    required this.riskLevel,
  });

  @override
  List<Object?> get props => [
    ingredientName,
    primaryHealthImpact,
    clinicalMechanism,
    detailedDescription,
    riskLevel,
  ];
}

enum RiskLevel { low, medium, high }
