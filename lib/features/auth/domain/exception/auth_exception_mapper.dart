


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_supabase/features/auth/domain/exception/app_auth_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/supabase_error_codes.dart';

class AuthExceptionMapper {

  const AuthExceptionMapper._();

  static AppAuthException mapSupabaseAuthException(AuthException e) {
    if(kDebugMode) {
      print('Supabase Auth Exception: ${e.message}, Code: ${e.code}');
    }

    String message;
    String? code = e.code;

    switch (code) {
      case SupabaseErrorCodes.emailExists:
        message = 'Account associated with this email already exists.';
        break;

      case SupabaseErrorCodes.emailNotConfirmed:
        message = 'Please confirm your email before logging in.';
        break;

      case SupabaseErrorCodes.invalidEmailAddress:
        message = 'Invalid email address.';
        break;

      case SupabaseErrorCodes.invalidCredentials:
        message = 'Invalid email or password.';
        break;

      case SupabaseErrorCodes.userNotFound:
        message = 'No user found for that email.';
        break;

      case SupabaseErrorCodes.weakPassword:
        message = 'The password is too weak.';
        break;

      case SupabaseErrorCodes.samePassword:
        message = 'New password must be different from the previous password.';
        break;

      case SupabaseErrorCodes.sessionExpired:
        message = 'Your session has expired. Please login again.';
        break;

      case SupabaseErrorCodes.unexpectedFailure:
        message = 'An unexpected authentication error occurred.';
        break;

      default:
        message = e.message.isNotEmpty
            ? e.message
            : 'An unknown authentication error occurred.';
        break;
    }

    return AppAuthException(message, code: code);
  }

  static AppAuthException mapFormatException(FormatException e) {
    if(kDebugMode) {
      print('Format Exception: ${e.message}, Code: ${e.toString()}');
    }

    return AppAuthException(e.message, code: 'Format-Error');
  }

  static AppAuthException mapSocketException(SocketException e) {
    if(kDebugMode) {
      print('Socket Exception: ${e.message}, Code: ${e.toString()}');
    }

    return AppAuthException('Network error occurred, check your connection', code: 'network-failure');
  }

  static AppAuthException mapGenericException(Object e) {
    if(kDebugMode) {
      print('Generic Exception: ${e.toString()}');
    }

    return AppAuthException(e.toString());
  }

}