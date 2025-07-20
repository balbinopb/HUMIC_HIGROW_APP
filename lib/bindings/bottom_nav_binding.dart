import 'package:get/get.dart';
import 'package:higrow/controllers/bottom_nav_controller.dart';
import 'package:higrow/controllers/history_controller.dart';
import 'package:higrow/controllers/profile_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.put(HistoryController());
    Get.put(ProfileController());
  }
}
