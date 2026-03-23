

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';

@immutable
sealed class IngredientScannerState extends Equatable{
  const IngredientScannerState();

  @override
  List<Object?> get props => [];
}

class IngredientScannerInitial extends IngredientScannerState {}

class IngredientsLoading extends IngredientScannerState {

}

class IngredientsLoaded extends IngredientScannerState {
  final HealthAnalysis healthAnalysis;

  const IngredientsLoaded({required this.healthAnalysis});

  @override
  List<Object?> get props => [healthAnalysis];
}

class IngredientsFailure extends IngredientScannerState {
  final String errorMessage;

  const IngredientsFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}