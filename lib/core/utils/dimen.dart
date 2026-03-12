import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWeight {
  const TextWeight._();

  static FontWeight w100 = FontWeight.w100;
  static FontWeight w200 = FontWeight.w200;
  static FontWeight w300 = FontWeight.w300;
  static FontWeight w400 = FontWeight.w400;
  static FontWeight w500 = FontWeight.w500;
  static FontWeight w600 = FontWeight.w600;
  static FontWeight w700 = FontWeight.w700;
  static FontWeight w800 = FontWeight.w800;
  static FontWeight w900 = FontWeight.w900;
}

class TextThemes {
  final BuildContext context;

  TextThemes(this.context);

  TextStyle get bodySmall => Theme.of(context).textTheme.bodySmall!;

  TextStyle get bodyMedium => Theme.of(context).textTheme.bodyMedium!;

  TextStyle get bodyLarge => Theme.of(context).textTheme.bodyLarge!;

  TextStyle get labelSmall => Theme.of(context).textTheme.labelSmall!;

  TextStyle get labelMedium => Theme.of(context).textTheme.labelMedium!;

  TextStyle get labelLarge => Theme.of(context).textTheme.labelLarge!;

  TextStyle get headlineSmall => Theme.of(context).textTheme.headlineSmall!;

  TextStyle get titleSmall => Theme.of(context).textTheme.titleSmall!;

  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;

  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;

  TextStyle get headlineMedium => Theme.of(context).textTheme.headlineMedium!;

  TextStyle get headlineLarge => Theme.of(context).textTheme.headlineLarge!;

  TextStyle get displaySmall => Theme.of(context).textTheme.displaySmall!;

  TextStyle get displayMedium => Theme.of(context).textTheme.displayMedium!;

  TextStyle get displayLarge => Theme.of(context).textTheme.displayLarge!;
}

class CustomPadding {
  const CustomPadding._();

  static EdgeInsetsGeometry screenPadding = EdgeInsets.all(16);
  static EdgeInsetsGeometry iconPadding = EdgeInsets.all(19);
}

class CustomRadius {
  const CustomRadius._();

  static BorderRadius buttonRadius = BorderRadius.circular(12);
  static BorderRadius iconRadius = BorderRadius.circular(20);
}
