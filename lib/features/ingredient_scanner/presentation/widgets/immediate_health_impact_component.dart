import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/immediate_health_impact.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_impact_tile.dart';

class ImmediateHealthImpactComponent extends StatelessWidget {
  const ImmediateHealthImpactComponent({super.key, required this.healthImpacts});

  final List<ImmediateHealthImpact> healthImpacts;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeading(
            heading: AppStrings.ingredientScanner.immediateHealthImpactHeading,
          ),
          const SizedBox(height: 7),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HealthImpactTile(
                impactTitle: healthImpacts[index].impactLabel,
                impactDescription:
                    healthImpacts[index].impactDescription,
              );
            },
            itemCount: healthImpacts.length,
          ),
        ],
      ),
    );
  }
}
