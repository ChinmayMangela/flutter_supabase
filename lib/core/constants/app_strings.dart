

class AppStrings {

  const AppStrings._();

  static const auth = _Auth();
  static const home = _Home();
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
  final String forgotPassword = 'Forgot Password';
}


class _Home {
  const _Home();

  final String fridgeVisionHeading = 'Fridge Vision';
  final String fridgeVisionDescription = 'Analyze fridge contents and\ngenerate recipe recommendations';
  final String ingredientScannerHeading = 'Ingredient Scanner';
  final String ingredientScannerDescription = 'Decode product labels and analyze nutritional composition';
  final String instructionsHeading = 'Instructions';
  final String instructionsDescription = 'Center the product ingredients within the frame, and\ntake a picture';
}