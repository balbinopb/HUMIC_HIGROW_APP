import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  final _authController = Get.find<AuthController>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                    color: AppColors.yellow2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),

                Positioned(
                  height: 311,
                  width: 327,
                  top: -175,
                  left: 214,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),
                Positioned(
                  height: 73,
                  width: 73,
                  top: 85,
                  left: 65,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),
                Positioned(
                  height: 40,
                  width: 40,
                  top: 133,
                  left: 184,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),

                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 55,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              controller.username,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              controller.email,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 310,
              height: 38,
              decoration: BoxDecoration(color: AppColors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow2,
                foregroundColor: AppColors.white,
              ),
              icon: Icon(Icons.logout),
              label: Text("Logout"),
              onPressed: () async {
                final confirmed = await Get.dialog<bool>(
                  AlertDialog(
                    // backgroundColor: Colors.yellow.shade600,
                    title: Text(
                      'Confirm Logout',
                      style: TextStyle(color: AppColors.black),
                    ),
                    content: Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(color: AppColors.black),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(result: false),
                        child: Text(
                          'No',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.back(result: true),
                        child: Text(
                          'Yes',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                );

                if (confirmed == true) {
                  await _authController.logout();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
