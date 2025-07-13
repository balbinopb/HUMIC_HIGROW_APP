import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/models/measure_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController {
  final measurements = <Measurement>[].obs;

  final searchController = Rx<TextEditingController>(TextEditingController());

  @override
  void onInit() {
    super.onInit();
    fetchMeasurements();
  }

  Future<void> fetchMeasurements() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final uri = Uri.parse('http://10.110.0.145:3000/api/height');
    try {
      final res = await http.get(uri, headers: {
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        measurements.assignAll(data.map((e) => Measurement.fromJson(e)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch measurements');
      }
    } catch (e) {
      Get.snackbar('Error', 'Fetch failed: $e');
    }
  }
}
