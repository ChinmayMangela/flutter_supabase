import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';

class HealthImpactTile extends StatelessWidget {
  const HealthImpactTile({super.key, required this.impactTitle, required this.impactDescription});

  final String impactTitle;
  final String impactDescription;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        height: 40,width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black
        ),
        child: Icon(AppIcons.home.warning, color: AppColors.white,),
      ),
      title: Text(impactTitle, style: TextThemes(context).bodyLarge.copyWith(
        fontWeight: TextWeight.w900,
      ),),
      subtitle: Text(impactDescription, style: TextThemes(context).labelMedium.copyWith(
        color: AppColors.greyColor
      ),),
    );
  }
}
