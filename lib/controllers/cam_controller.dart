import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:higrow/services/height_services.dart';

class CamController extends GetxController {
  late CameraController cameraController;
  var isUploading = false.obs;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await cameraController.initialize();
  }

  Future<void> takePicture() async {
    try {
      if (!cameraController.value.isInitialized ||
          cameraController.value.isTakingPicture) return;

      final XFile file = await cameraController.takePicture();
      final Uint8List imageBytes = await file.readAsBytes();

      final box = GetStorage();
      final token = box.read('token');

      if (token == null) {
        Get.snackbar("Unauthorized", "Please login first.");
        return;
      }

      isUploading.value = true;

      final uploadResult = await HeightServices.uploadPhoto(
        imageBytes: imageBytes,
        token: token,
      );

      if (!uploadResult['success']) {
        isUploading.value = false;
        Get.snackbar("Upload Failed", uploadResult['error']);
        return;
      }

      final recordId = uploadResult['data']['id'];

      final submitResult = await HeightServices.submitData(
        id: recordId,
        token: token,
      );

      isUploading.value = false;

      if (submitResult['success']) {
        final height = submitResult['data']['height_cm'];
        Get.snackbar("Success", "Predicted Height: $height cm");
      } else {
        Get.snackbar("Prediction Failed", submitResult['error']);
      }
    } catch (e) {
      isUploading.value = false;
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong.");
    }
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
