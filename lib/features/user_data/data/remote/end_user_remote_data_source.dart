import 'dart:io';

import 'package:flutter_supabase/features/auth/data/model/end_user_model.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/model/health_analysis_model.dart';
import 'package:flutter_supabase/features/user_data/domain/exception/supabase_database_exception_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class EndUserRemoteDataSource {
  Future<void> saveUser({required EndUserModel user});

  Future<EndUserModel> getUserData();

  Future<List<HealthAnalysisModel>> getPreviouslyScannedData({
    required String userId,
  });
}

class EndUserRemoteDataSourceImpl implements EndUserRemoteDataSource {
  final SupabaseClient client;

  const EndUserRemoteDataSourceImpl({required this.client});

  @override
  Future<void> saveUser({required EndUserModel user}) async {
    return await _handleException(() async {
      await client.from('end_users').upsert(user.toJson());
    });
  }

  @override
  Future<List<HealthAnalysisModel>> getPreviouslyScannedData({
    required String userId,
  }) async {
    return await _handleException(() async {
      final List<Map<String, dynamic>> data = await client
          .from('health_analysis')
          .select()
          .eq('user_id', userId);

      return data.map((item) => HealthAnalysisModel.fromJson(item)).toList();
    });
  }

  @override
  Future<EndUserModel> getUserData() async {
    return await _handleException(() async {
      final data = await client
          .from('end_users')
          .select()
          .eq('user_id', client.auth.currentUser!.id)
          .single();
      return EndUserModel.fromJson(data);
    });
  }

  Future<T> _handleException<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on PostgrestException catch (e) {
      throw SupabaseDatabaseExceptionMapper.mapPostgresException(e);
    } on SocketException catch (e) {
      throw SupabaseDatabaseExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw SupabaseDatabaseExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw SupabaseDatabaseExceptionMapper.mapGenericException(e);
    }
  }
}
