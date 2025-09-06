import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/app/constants/app_collors.dart';
import 'package:higrow/app/data/models/height_record.dart';
import 'package:higrow/app/modules/profile/controllers/profile_controller.dart';
import 'package:intl/intl.dart';

class MeasurementTile extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  final HeightRecord measurement;

  MeasurementTile({super.key, required this.measurement});

  String formatDate(String rawDate) {
    try {
      final dateTime = DateTime.parse(rawDate);
      return DateFormat.yMMMMd().format(dateTime);
    } catch (e) {
      return rawDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Profile / measurement image
          if (measurement.photoBase64 != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                base64Decode(measurement.photoBase64!),
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // ignore: deprecated_member_use
                color: AppColors.grey.withOpacity(0.2),
              ),
              child: Icon(Icons.image_not_supported, color: AppColors.grey),
            ),

          SizedBox(width: 16),

          // Name + date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileController.username,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  formatDate(measurement.createdAt),
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Height value aligned right
          Text(
            measurement.height != null
                ? '${double.tryParse(measurement.height!)?.toStringAsFixed(2)} cm'
                : '-',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
