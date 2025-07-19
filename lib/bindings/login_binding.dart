
import 'package:get/get.dart';
import 'package:higrow/controllers/auth_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(()=>AuthController());
  }

}