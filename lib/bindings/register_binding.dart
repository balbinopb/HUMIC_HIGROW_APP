
import 'package:get/get.dart';
import 'package:higrow/controllers/auth_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(()=> AuthController());
  }
  
}