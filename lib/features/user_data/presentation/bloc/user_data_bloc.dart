import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/current_user_data.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/get_scanned_history.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/save_scanned_data.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/save_user.dart';
import 'package:flutter_supabase/features/user_data/presentation/bloc/user_data_event.dart';
import 'package:flutter_supabase/features/user_data/presentation/bloc/user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final SaveUser saveUser;
  final CurrentUserData currentUserData;
  final GetScannedHistory getScannedHistory;
  final SaveScannedData saveScannedData;

  UserDataBloc({
    required this.saveUser,
    required this.currentUserData,
    required this.getScannedHistory,
    required this.saveScannedData,
  }) : super(UserDataState.initial()) {
    on<SaveUserRequested>(_onSaveUserRequested);
    on<GetCurrentUserRequested>(_onGetCurrentUserRequested);
    on<SaveScannedDataRequested>(_onSaveScannedDataRequested);
    on<GetScannedHistoryRequested>(_onGetScannedHistoryRequested);
  }

  Future<void> _onSaveUserRequested(
    SaveUserRequested event,
    Emitter<UserDataState> emit,
  ) async {
    emit(state.copyWith(state: DataState.loading));
    final result = await saveUser(SaveUserParams(user: event.endUser));
    result.fold(
      (failure) => emit(
        state.copyWith(state: DataState.failure, errorMessage: failure.message),
      ),
      (_) => emit(
        state.copyWith(state: DataState.success, endUser: event.endUser),
      ),
    );
  }

  Future<void> _onGetCurrentUserRequested(
    GetCurrentUserRequested event,
    Emitter<UserDataState> emit,
  ) async {
    emit(state.copyWith(state: DataState.loading));
    final result = await currentUserData(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(state: DataState.failure, errorMessage: failure.message),
      ),
      (user) => emit(state.copyWith(state: DataState.success, endUser: user)),
    );
  }

  Future<void> _onSaveScannedDataRequested(
    SaveScannedDataRequested event,
    Emitter<UserDataState> emit,
  ) async {
    emit(state.copyWith(state: DataState.loading));
    final result = await saveScannedData(
      ScannedDataParams(event.healthAnalysis),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(state: DataState.failure, errorMessage: failure.message),
      ),
      (_) {
        final updatedHistory = List<HealthAnalysis>.from(
          state.healthAnalysisHistory,
        )..add(event.healthAnalysis);
        emit(state.copyWith(
          state: DataState.success,
          healthAnalysisHistory: updatedHistory,
        ));
      },
    );
  }

  Future<void> _onGetScannedHistoryRequested(
    GetScannedHistoryRequested event,
    Emitter<UserDataState> emit,
  ) async {
    emit(state.copyWith(state: DataState.loading));
    final result = await getScannedHistory(
      GetScannedHistoryParams(event.userId),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(state: DataState.failure, errorMessage: failure.message),
      ),
      (scannedHistory) => emit(
        state.copyWith(
          state: DataState.success,
          healthAnalysisHistory: scannedHistory,
        ),
      ),
    );
  }
}
