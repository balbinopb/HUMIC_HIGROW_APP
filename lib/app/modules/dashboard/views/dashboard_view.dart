import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/app/constants/app_collors.dart';
import 'package:higrow/app/routes/app_pages.dart';
import 'package:higrow/app/widgets/measurement_tile.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND GRADIENT
          Container(
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 216, 177, 20), AppColors.white],
              ),
            ),
          ),

          // CONTENT WITH REFRESH
          RefreshIndicator(
            onRefresh: () async {
              await controller.historyC.fetchMeasurements();
            },
            color: AppColors.yellow2,
            child: ListView(
              padding: EdgeInsets.all(35),
              children: [
                // LOGO AND TOGGLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo_with_white.png",
                      height: 21,
                      width: 61,
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // TEXT AND IMAGE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Let your growth\nbe a memory !",
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFF1772F),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        "assets/images/kids_jump.png",
                        height: 190,
                        width: 181,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      controller.historyC.fetchMeasurements();
                      final result = await Get.toNamed(Routes.CAMERA);
                      if (result == true) {
                        controller.historyC.fetchMeasurements();
                      }
                    },
                    icon: Icon(Icons.design_services, color: AppColors.white),
                    label: Text(
                      'Start Measurements',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF1772F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),

                Text(
                  "Recent Measure Project",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 22),

                Obx(() {
                  if (controller.historyC.isLoading.value) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(
                          color: Color(0xFFF1772F),
                        ),
                      ),
                    );
                  }

                  final validMeasurements =
                      controller.historyC.filteredMeasurements
                          .where(
                            (m) => m.height != null && m.photoBase64 != null,
                          )
                          .toList();

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount:
                        validMeasurements.length > 5
                            ? 5
                            : validMeasurements.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return MeasurementTile(
                        measurement: validMeasurements[index],
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
