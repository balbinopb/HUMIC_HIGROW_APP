import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/models/measure_model.dart';
import 'package:higrow/views/history/mock.dart';

class HistoryController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var measurements = <Measurement>[].obs;

  void filterMeasurements(String query) {
    measurements.value =
        allMeasurements
            .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  @override
  void onInit() {
    super.onInit();
    measurements.value = allMeasurements;
  }
}
