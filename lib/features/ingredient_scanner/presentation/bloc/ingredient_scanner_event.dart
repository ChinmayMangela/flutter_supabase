

import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

sealed class IngredientScannerEvent extends Equatable {
  const IngredientScannerEvent();

  @override
  List<Object?> get props => [];
}

class ScanIngredientsRequested extends IngredientScannerEvent {
  final XFile file;

  const ScanIngredientsRequested({required this.file});

  @override
  List<Object?> get props => [file];
}