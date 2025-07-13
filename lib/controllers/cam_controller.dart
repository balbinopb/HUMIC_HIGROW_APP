import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:higrow/controllers/history_controller.dart';

class CamController extends GetxController {
  late CameraController cameraController;
  final isInitialized = false.obs;
  final cameras = <CameraDescription>[].obs;

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
    print('Image captured at ${imageFile.path}');
    await uploadAndPredict(File(imageFile.path));
  }

  Future<void> uploadAndPredict(File file) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final uriUpload = Uri.parse('http://10.110.0.145:3000/api/height/upload');
    final uriSubmit = Uri.parse('http://10.110.0.145:3000/api/height/submit');

    try {
      // Upload image
      var request = http.MultipartRequest('POST', uriUpload);
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('photo', file.path));

      final uploadResponse = await request.send();
      final resBody = await uploadResponse.stream.bytesToString();

      if (uploadResponse.statusCode != 200) {
        throw Exception('Upload failed: $resBody');
      }

      final uploadData = jsonDecode(resBody);
      final id = uploadData['id'];

      // Submit prediction
      final submitRes = await http.post(
        uriSubmit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'id': id}),
      );

      if (submitRes.statusCode == 200) {
        final result = jsonDecode(submitRes.body);
        Get.snackbar(
          'Prediction Result',
          'Height: ${result["height_cm"]} cm',
          duration: const Duration(seconds: 4),
        );

        // Refresh history
        Get.find<HistoryController>().fetchMeasurements();

      } else {
        throw Exception('Submit failed: ${submitRes.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
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
