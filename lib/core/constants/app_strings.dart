

class AppStrings {

  const AppStrings._();

  static const auth = _Auth();
}


class _Auth {
  const _Auth();

  final String signInHeading = 'Welcome to ZeroJunk';
  final String signInDescription = 'Your journey starts here';
  final String signInBottomMessage = 'Don\'t have an account?';
  final String signInLabel = 'Sign In';
  final String signUpHeading = 'Create Account';
  final String signUpDescription = 'Start your health journey';
  final String signUpBottomMessage = 'Already have an account?';
  final String signUpLabel = 'Sign Up';
}