import 'package:get/get.dart';
import 'package:higrow/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:higrow/app/modules/history/controllers/history_controller.dart';
import 'package:higrow/app/modules/profile/controllers/profile_controller.dart';
import 'package:higrow/app/modules/usage_guide/controllers/usage_guide_controller.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
    Get.lazyPut<UsageGuideController>(
      () => UsageGuideController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
