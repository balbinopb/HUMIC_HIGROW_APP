import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/controllers/bottom_nav_controller.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: controller.screens[controller.selectedIndex.value],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.yellow,
            currentIndex: controller.selectedIndex.value,
            onTap: (idx) => controller.selectedIndex.value = idx,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.straighten),
                label: 'Measure',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Usage Guide',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
