import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPadding.cardPadding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black.withValues(alpha: 0.08)),
        color: AppColors.white,
        borderRadius: CustomRadius.buttonRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 10),
            ),
          ],
      ),
      child: child,
    );
  }
}
