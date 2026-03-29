


import 'package:flutter_supabase/core/exception/app_exception.dart';

class SupabaseDatabaseException extends AppException{
  const SupabaseDatabaseException(super.message, {super.code});
}