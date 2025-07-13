// bindings/profile_binding.dart
import 'package:get/get.dart';
import 'package:higrow/controllers/profile_controller.dart';
import 'package:higrow/controllers/auth_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AuthController());
  }
}
