

import 'package:equatable/equatable.dart';

class NutritionalFact extends Equatable {
  final String label;
  final String value;

  const NutritionalFact({required this.label, required this.value});

  @override
  List<Object?> get props => [label, value];
}