

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
}