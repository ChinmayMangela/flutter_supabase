import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_container.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/custom_heading.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_impact_tile.dart';

class ImmediateHealthImpactComponent extends StatelessWidget {
  const ImmediateHealthImpactComponent({super.key, required this.healthImpact});

  final List<Map<String, String>> healthImpact;

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
                impactTitle: healthImpact[index]['impact_label'] ?? '',
                impactDescription:
                    healthImpact[index]['impact_description'] ?? '',
              );
            },
            itemCount: healthImpact.length,
          ),
        ],
      ),
    );
  }
}
