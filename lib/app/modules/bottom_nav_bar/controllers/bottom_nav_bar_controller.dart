import 'package:get/get.dart';
import 'package:higrow/app/modules/dashboard/views/dashboard_view.dart';
import 'package:higrow/app/modules/history/views/history_view.dart';
import 'package:higrow/app/modules/profile/views/profile_view.dart';
import 'package:higrow/app/modules/usage_guide/views/usage_guide_view.dart';

class BottomNavBarController extends GetxController {
  final selectedIndex=0.obs;

  final screens=[
    DashboardView(),
    HistoryView(),
    UsageGuideView(),
    ProfileView(),
  ];
}
