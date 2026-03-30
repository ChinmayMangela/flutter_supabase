import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';


@immutable
sealed class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object?> get props => [];
}


class SaveUserRequested extends UserDataEvent {
  final EndUser endUser;

  const SaveUserRequested({required this.endUser});

  @override
  List<Object?> get props => [endUser];
}


class GetCurrentUserRequested extends UserDataEvent {
  const GetCurrentUserRequested();
}


class SaveScannedDataRequested extends UserDataEvent {
  final HealthAnalysis healthAnalysis;

  const SaveScannedDataRequested({required this.healthAnalysis});

  @override
  List<Object?> get props => [healthAnalysis];
}


class GetScannedHistoryRequested extends UserDataEvent {
  final String userId;

  const GetScannedHistoryRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}