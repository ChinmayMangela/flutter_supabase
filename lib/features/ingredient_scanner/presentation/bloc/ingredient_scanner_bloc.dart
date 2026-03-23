import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/use_case/scan_ingredients.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_event.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_state.dart';

class IngredientScannerBloc
    extends Bloc<IngredientScannerEvent, IngredientScannerState> {
  final ScanIngredients scanIngredients;

  IngredientScannerBloc({required this.scanIngredients})
    : super(IngredientScannerInitial()) {
    on<ScanIngredientsRequested>(_onScanIngredients);
  }

  Future<void> _onScanIngredients(
    ScanIngredientsRequested event,
    Emitter<IngredientScannerState> emit,
  ) async {
    emit(IngredientsLoading());
    final result = await scanIngredients(
      ScanIngredientParams(file: event.file),
    );
    result.fold(
      (failure) => emit(IngredientsFailure(errorMessage: failure.message)),
      (healthAnalysis) =>
          emit(IngredientsLoaded(healthAnalysis: healthAnalysis)),
    );
  }
}
