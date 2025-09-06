import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/app/constants/app_collors.dart';
import 'package:higrow/app/modules/camera/controllers/cam_controller.dart';


class CameraView extends GetView<CamController> {
  const CameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera', style: TextStyle(color: AppColors.white)),
        centerTitle: true,
        backgroundColor: AppColors.yellow2,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Obx(() {
        if (!controller.isInitialized.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CameraPreview(controller.cameraController),
                ),
              ),
              SizedBox(height: 20),

              // Show prediction result
              Obx(
                () =>
                    controller.predictedHeight.value.isNotEmpty
                        ? Text(
                          'Height: ${controller.predictedHeight.value}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        : SizedBox(),
              ),

              SizedBox(height: 16),

              // Capture and Predict Button
              ElevatedButton.icon(
                onPressed: () {
                  controller.captureAndPredict();
                },
                label: Text('Capture & Predict Height'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow2,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 6),

              // Retake Button
              ElevatedButton.icon(
                onPressed: () {
                  controller.predictedHeight.value = '';
                },
                icon: Icon(Icons.refresh),
                label: Text('Refresh'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
