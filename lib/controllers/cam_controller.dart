
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CamController extends GetxController {
  
  late CameraController cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await cameraController.initialize();
  }

  @override
  void onClose() {
    // cameraController.dispose();
    super.onClose();
  }
}