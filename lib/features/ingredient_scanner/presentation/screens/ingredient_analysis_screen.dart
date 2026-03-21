import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/widgets/health_score_component.dart';

class IngredientAnalysisScreen extends StatefulWidget {
  const IngredientAnalysisScreen({super.key});

  @override
  State<IngredientAnalysisScreen> createState() =>
      _IngredientAnalysisScreenState();
}

class _IngredientAnalysisScreenState extends State<IngredientAnalysisScreen> {
  final rating = 3.0;
  final aiDescription = AppStrings.home.dummyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: CustomPadding.screenPadding,
      child: SingleChildScrollView(child: Column(children: [
        _buildHealthScoreComponent()
      ])),
    );
  }

  Widget _buildHealthScoreComponent() {
    return HealthScoreComponent(rating: rating, aiDescription: aiDescription);
  }
}
