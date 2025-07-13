import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/controllers/cam_controller.dart';

class CameraScreen extends GetView<CamController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),

      body: Obx(() {
        if (!controller.isInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(child: CameraPreview(controller.cameraController)),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                controller.captureAndPredict();
              },
              child: const Text('Capture & Predict Height'),
            ),

            const SizedBox(height: 32),
          ],
        );
      }),
    );
  }
}
