// bindings/initial_binding.dart
import 'package:get/get.dart';
import 'package:higrow/controllers/history_controller.dart';
import '../controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true); 
    Get.put(HistoryController(), permanent: true); 
  }
}
