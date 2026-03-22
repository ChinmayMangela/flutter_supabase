import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/common/service/camera_service.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/constants/app_icons.dart';
import 'package:flutter_supabase/core/constants/app_strings.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/screens/image_display_screen.dart';

class IngredientScannerScreen extends StatefulWidget {
  const IngredientScannerScreen({super.key});

  @override
  State<IngredientScannerScreen> createState() =>
      _IngredientScannerScreenState();
}

class _IngredientScannerScreenState extends State<IngredientScannerScreen> {
  final CameraController? controller = CameraService().controller;

  void _onCaptureTap() async {
    final XFile? image = await CameraService().takePicture();
    if (image != null && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ImageDisplayScreen(image: image)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller != null && controller!.value.isInitialized
          ? _buildCameraPreview()
          : _buildLoading(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          const SizedBox(height: 20),
          Text(
            "Waking up the lens...",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Stack(
      children: [
        Positioned.fill(child: CameraPreview(controller!)),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildInstructions(), _buildBottomControls()],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Text(
            AppStrings.ingredientScanner.instructionsHeading.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.ingredientScanner.instructionsDescription,
            textAlign: TextAlign.center,
            style: TextThemes(context).bodyMedium.copyWith(
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(AppIcons.home.flashOff, color: AppColors.white),
            onPressed: () {},
          ),

          _buildCaptureButton(),
          IconButton(
            icon: Icon(AppIcons.home.galleryIcon, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCaptureButton() {
    return GestureDetector(
      onTap: _onCaptureTap,
      child: Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Center(
          child: Container(
            height: 65,
            width: 65,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
