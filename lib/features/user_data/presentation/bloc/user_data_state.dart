import 'package:equatable/equatable.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';

class UserDataState extends Equatable {
  final DataState state;
  final EndUser? endUser;
  final HealthAnalysis? healthAnalysis;
  final String? errorMessage;

  const UserDataState({
    required this.state,
    this.endUser,
    this.healthAnalysis,
    this.errorMessage,
  });

  UserDataState copyWith({
    DataState? state,
    EndUser? endUser,
    HealthAnalysis? healthAnalysis,
    String? errorMessage,
  }) {
    return UserDataState(
      state: state ?? this.state,
      endUser: endUser ?? this.endUser,
      healthAnalysis: healthAnalysis ?? this.healthAnalysis,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory UserDataState.initial() {
    return UserDataState(state: DataState.initial);
  }

  @override
  List<Object?> get props => [state, endUser, healthAnalysis, errorMessage];
}

enum DataState { initial, loading, loaded, failure }
