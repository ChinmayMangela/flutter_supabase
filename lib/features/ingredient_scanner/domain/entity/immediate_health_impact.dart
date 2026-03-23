import 'package:equatable/equatable.dart';

class ImmediateHealthImpact extends Equatable {
  final String impactLabel;
  final String impactDescription;

  const ImmediateHealthImpact({
    required this.impactLabel,
    required this.impactDescription,
  });

  @override
  List<Object?> get props => [impactLabel, impactDescription];
}
