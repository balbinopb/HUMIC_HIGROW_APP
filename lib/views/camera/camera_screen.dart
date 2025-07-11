import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:higrow/controllers/cam_controller.dart';

class CameraScreen extends GetView<CamController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.initializeCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  SizedBox.expand(
                    child: CameraPreview(controller.cameraController),
                  ),
                  Positioned(
                    top: 100,
                    right: 30,
                    bottom: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 2,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: GestureDetector(
                        onTap: () => controller.takePicture(),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 4,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () =>
                        controller.isUploading.value
                            ? Container(
                              color: Colors.black54,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                            : SizedBox.shrink(),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
