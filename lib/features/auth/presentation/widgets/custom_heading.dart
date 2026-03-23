import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.heading, this.textColor = Colors.black});

  final String heading;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextThemes(
        context,
      ).headlineSmall.copyWith(fontWeight: TextWeight.w900, color: textColor),
    );
  }
}
