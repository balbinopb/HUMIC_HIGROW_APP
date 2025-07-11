import 'package:get/get.dart';
import 'package:higrow/controllers/bottom_nav_controller.dart';
import 'package:higrow/controllers/cam_controller.dart';
import 'package:higrow/controllers/dashboard_controller.dart';
import 'package:higrow/controllers/history_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HistoryController());
    Get.lazyPut(() => CamController());
  }
}
