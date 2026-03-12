import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextThemes(
        context,
      ).headlineMedium.copyWith(fontWeight: TextWeight.w900),
    );
  }
}
