
import 'package:get/get.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=>LoginController());
    Get.lazyPut<AuthController>(()=>AuthController());
    
  }

}