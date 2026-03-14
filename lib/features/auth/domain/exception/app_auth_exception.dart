

import 'package:flutter_supabase/core/exception/app_exception.dart';

class AppAuthException extends AppException {
  AppAuthException(super.message, {super.code});
}