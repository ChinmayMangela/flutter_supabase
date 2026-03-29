

class SupabaseErrorCodes {

  const SupabaseErrorCodes._();
  // Auth
  static const String invalidEmailAddress = 'email_address_invalid';
  static const String emailExists = 'email_exists';
  static const String emailNotConfirmed = 'email_not_confirmed';
  static const String invalidCredentials = 'invalid_credentials';
  static const String samePassword = 'same_password';
  static const String userNotFound = 'user_not_found';
  static const String weakPassword = 'weak_password';
  static const String unexpectedFailure = 'unexpected_failure';
  static const String sessionExpired = 'session_expired';


  // DATABASE POSTGRES
  static const String invalidSchemaName = '3F000';
  static const String dataException = '22000';
  static const String uniqueViolation = '23505';
  static const String foreignKeyViolation = '23503';
  static const String notNullViolation = '23502';
  static const String checkViolation = '23514';
  static const String insufficientPrivilege = '42501';
  static const String undefinedColumn = '42703';
  static const String undefinedTable = '42P01';
  static const String rowNotFound = 'PGRST116';
  static const String requestTimeout = '57014';
  static const String badRequest = 'P0001';
  static const String databaseShutDown = '57P01';
  static const String noConnectionAvailable = '57P03';
}