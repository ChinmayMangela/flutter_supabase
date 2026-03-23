import 'package:equatable/equatable.dart';

import 'nutritional_fact.dart';

class NutritionalFacts extends Equatable {
  final int productQuantity;
  final String quantityMeasure;
  final List<NutritionalFact> facts;

  const NutritionalFacts({
    required this.productQuantity,
    required this.quantityMeasure,
    required this.facts,
  });

  @override
  List<Object?> get props => [productQuantity, quantityMeasure, facts];
}
