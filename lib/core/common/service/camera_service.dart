import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraService with WidgetsBindingObserver {
  static final CameraService _instance = CameraService._internal();

  CameraService._internal();

  // public constructor to give a global access to the instance
  factory CameraService() {
    return _instance;
  }

  CameraController? controller;
  List<CameraDescription>? cameras;
  bool isInitialized = false;

  Future<void> init() async {
    try {
      // check if the camera is initialized or not if yes then we don't need to
      // re-run our initialization code again
      if (isInitialized) return;

      // get available cameras for a specific device
      cameras = await availableCameras();

      // If that device does not have any cameras then throw the exception with a following message
      if (cameras == null || cameras!.isEmpty) {
        throw Exception("No cameras found on this device");
      }

      // if the device has cameras
      // Configure the controller
      // first parameter takes camera description as we have given the back camera description
      // second parameter for the resolution
      controller = CameraController(
        cameras![0],
        ResolutionPreset.high,
        enableAudio: false,
      );

      // After configuring the controller initialize the camera controller(camera hardware)
      await controller!.initialize();

      // set our bool variable as true
      isInitialized = true;
    } catch (e) {
      debugPrint("Camera init error: $e");
      controller = null;
      isInitialized = false;

      rethrow;
    }
  }

  Future<void> disposeCamera() async {
    try {
      await controller?.dispose();
    } catch (e) {
      debugPrint("Camera dispose error: $e");
    } finally {
      controller = null;
      isInitialized = false;
    }
  }

  Future<void> handleLifeCycle(AppLifecycleState state) async {
    try {
      if (controller == null) return;
      if (state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused) {
        // DO NOTHING → keep camera instance alive
        debugPrint("App inactive/paused → keeping camera alive");
      } else if (state == AppLifecycleState.resumed) {
        // Only reinitialize if controller got invalid
        if (!controller!.value.isInitialized) {
          await init();
        }
      }
    } catch (e) {
      debugPrint("Lifecycle error: $e");
    }
  }


  Future<XFile?> takePicture() async {
    try {
      if(controller == null || !controller!.value.isInitialized) {
        throw Exception("Camera has not initialized yet");
      }

      if(controller!.value.isTakingPicture) {
        return null;
      }

      final XFile image = await controller!.takePicture();
      return image;
    } catch (e) {
      debugPrint("Error capturing image: $e");
      return null;
    }
  }

}
