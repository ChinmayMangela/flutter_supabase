import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class BottomMessage extends StatelessWidget {
  const BottomMessage({super.key, required this.bottomMessage, required this.authLabel, required this.onTap});

  final String bottomMessage;
  final String authLabel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(bottomMessage),
        TextButton(onPressed: onTap, child: Text(authLabel, style: TextThemes(context).bodyMedium.copyWith(
          fontWeight: TextWeight.w700
        ),))
      ],
    );
  }
}
