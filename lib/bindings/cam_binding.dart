
import 'package:get/get.dart';
import 'package:higrow/controllers/cam_controller.dart';

class CamBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(()=>CamController());
    Get.lazyPut<CamController>(() => CamController());
  }
  
}