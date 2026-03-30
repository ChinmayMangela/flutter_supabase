import 'package:equatable/equatable.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';

class UserDataState extends Equatable {
  final DataState state;
  final EndUser? endUser;
  final List<HealthAnalysis> healthAnalysisHistory;
  final String? errorMessage;

  const UserDataState({
    required this.state,
    this.endUser,
    this.healthAnalysisHistory = const [],
    this.errorMessage,
  });

  UserDataState copyWith({
    DataState? state,
    EndUser? endUser,
    List<HealthAnalysis>? healthAnalysisHistory,
    String? errorMessage,
  }) {
    return UserDataState(
      state: state ?? this.state,
      endUser: endUser ?? this.endUser,
      healthAnalysisHistory: healthAnalysisHistory ?? this.healthAnalysisHistory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory UserDataState.initial() {
    return UserDataState(state: DataState.initial);
  }

  @override
  List<Object?> get props => [state, endUser, healthAnalysisHistory, errorMessage];
}

enum DataState { initial, loading, success, failure }
