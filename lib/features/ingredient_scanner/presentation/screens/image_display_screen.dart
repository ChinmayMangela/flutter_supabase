import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/entity/health_analysis.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_bloc.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_event.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_state.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/screens/ingredient_analysis_screen.dart';

class ImageDisplayScreen extends StatefulWidget {
  const ImageDisplayScreen({super.key, required this.image});

  final XFile image;

  @override
  State<ImageDisplayScreen> createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  Future<void> _scanImage() async {
    context.read<IngredientScannerBloc>().add(
      ScanIngredientsRequested(file: widget.image),
    );
  }

  Future<void> _showModalBottomSheet(HealthAnalysis healthAnalysis) {
    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: CustomRadius.buttonRadius),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: IngredientAnalysisScreen(healthAnalysis: healthAnalysis),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<IngredientScannerBloc, IngredientScannerState>(
            builder: (context, state) {
              return TextButton(
                onPressed: _scanImage,
                child: state is IngredientsLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CupertinoActivityIndicator(
                          color: AppColors.black,
                        ),
                      )
                    : Text('Use photo'),
              );
            },
            listener: (context, state) {
              if (state is IngredientsLoaded) {
                debugPrint(state.healthAnalysis.toString());
                _showModalBottomSheet(state.healthAnalysis);
              } else if (state is IngredientsFailure) {
                HelperFunctions.showSnackBar(state.errorMessage);
              }
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: HelperFunctions.getScreenHeight(context),
      width: HelperFunctions.getScreenWidth(context),
      child: Image.file(File(widget.image.path), fit: BoxFit.fill),
    );
  }
}
