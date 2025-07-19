import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:higrow/services/height_services.dart';

class CamController extends GetxController {
  late CameraController cameraController;
  final isInitialized = false.obs;
  final cameras = <CameraDescription>[].obs;
  final predictedHeight = ''.obs;

  final HeightServices _heightService = HeightServices();

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  Future<void> initializeCamera({int cameraIndex = 0}) async {
    try {
      cameras.value = await availableCameras();
      if (cameras.isEmpty) {
        Get.snackbar('Camera Error', 'No cameras available');
        return;
      }

      cameraController = CameraController(
        cameras[cameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController.initialize();
      isInitialized.value = true;
    } catch (e) {
      Get.snackbar('Camera Error', 'Failed to initialize: $e');
    }
  }

  Future<void> captureAndPredict() async {
    if (!cameraController.value.isInitialized) return;

    final imageFile = await cameraController.takePicture();

    try {
      final result = await _heightService.uploadAndPredict(File(imageFile.path));
      if (result != null) {
        predictedHeight.value = result;

        Get.snackbar(
          'Prediction Success',
          'Height: $result',
          duration: const Duration(seconds: 4),
        );
      }
    } catch (e) {
      return;
    }
  }

  @override
  void onClose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    super.onClose();
  }
}
