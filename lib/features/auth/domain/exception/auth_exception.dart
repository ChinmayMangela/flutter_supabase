

import 'package:flutter_supabase/core/exception/app_exception.dart';

class AuthException extends AppException {
  AuthException(super.message, {super.code});
}