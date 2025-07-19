import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/models/height_record.dart';
import 'package:higrow/services/height_services.dart';

class HistoryController extends GetxController {
  final measurements = <HeightRecord>[].obs;
  final filteredMeasurements = <HeightRecord>[].obs;
  final searchController = TextEditingController();

  final _service = HeightServices();

  @override
  void onInit() {
    super.onInit();
    fetchMeasurements();
  }

  void fetchMeasurements() async {
    try {
      final result = await _service.fetchRecords();
      measurements.assignAll(result);
      filteredMeasurements.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", "Failed to load measurements");
    }
  }

  void filterMeasurements(String keyword) {
    final lowerKeyword = keyword.toLowerCase();
    filteredMeasurements.value = measurements.where((record) {
      return record.createdAt.toLowerCase().contains(lowerKeyword);
    }).toList();
  }
}
