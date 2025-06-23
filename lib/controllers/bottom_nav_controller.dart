

import 'package:get/get.dart';
import 'package:higrow/views/dashboard/dashboard_screen.dart';
import 'package:higrow/views/history/history_screen.dart';
import 'package:higrow/views/profile/profile_screen.dart';
import 'package:higrow/views/usage_guide/usage_guide.dart';

class BottomNavController extends GetxController{

  final selectedIndex=0.obs;

  final screens=[
    DashboardScreen(),
    HistoryScreen(),
    UsageGuide(),
    ProfileScreen(),
  ];

}