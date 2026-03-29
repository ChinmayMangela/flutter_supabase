

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_supabase/core/constants/supabase_error_codes.dart';
import 'package:flutter_supabase/features/user_data/domain/exception/supabase_database_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseExceptionMapper {
  const SupabaseDatabaseExceptionMapper._();
  static SupabaseDatabaseException mapPostgresException(PostgrestException e) {
    debugPrint("Postgrest exception: ${e.message}, code: ${e.code}, details: ${e.details}");

    final String code = e.code ?? '';

    switch (code) {
      case SupabaseErrorCodes.uniqueViolation:
        return SupabaseDatabaseException(
          'This record already exists.',
          code: SupabaseErrorCodes.uniqueViolation,
        );

      case SupabaseErrorCodes.foreignKeyViolation:
        return const SupabaseDatabaseException(
          'This action is not allowed because this data is linked elsewhere.',
          code: SupabaseErrorCodes.foreignKeyViolation,
        );

      case SupabaseErrorCodes.insufficientPrivilege:
        return const SupabaseDatabaseException(
          'Permission denied. You might not have access to this record.',
          code: SupabaseErrorCodes.insufficientPrivilege,
        );

      case SupabaseErrorCodes.rowNotFound:
        return const SupabaseDatabaseException(
          'The requested data was not found.',
          code: SupabaseErrorCodes.rowNotFound,
        );

      case SupabaseErrorCodes.notNullViolation:
        return const SupabaseDatabaseException(
          'A required field is missing.',
          code: SupabaseErrorCodes.notNullViolation,
        );

      case SupabaseErrorCodes.requestTimeout:
        return const SupabaseDatabaseException(
          'The request took too long. Please check your connection.',
          code: SupabaseErrorCodes.requestTimeout,
        );

      case SupabaseErrorCodes.databaseShutDown:
      case SupabaseErrorCodes.noConnectionAvailable:
        return const SupabaseDatabaseException(
          'The database server is currently unavailable.',
          code: 'server_unavailable',
        );

      default:
        return SupabaseDatabaseException(
          e.message,
          code: code.isEmpty ? 'unknown_db_error' : code,
        );
    }
  }

  static SupabaseDatabaseException mapSocketException(SocketException e) {
    debugPrint("Socket exception: ${e.message}, code: 'network-error'");
    return SupabaseDatabaseException(e.message, code: 'Network-error');
  }

  static SupabaseDatabaseException mapFormatException(FormatException e) {
    debugPrint("Format exception: ${e.message}, code: 'Format-error");
    return SupabaseDatabaseException(e.message);
  }

  static SupabaseDatabaseException mapGenericException(Object e) {
    debugPrint("Generic exception: ${e.toString()}");
    return SupabaseDatabaseException(e.toString());
  }
}