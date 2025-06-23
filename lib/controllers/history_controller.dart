import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/models/measure_model.dart';
import 'package:higrow/views/history/mock.dart';

class HistoryController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var measurements = <Measurement>[].obs;
  final searchQuery = ''.obs;
  late Worker _debounceWorker;

  void filterMeasurements(String query) {
    measurements.value =
        allMeasurements
            .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  @override
  void onInit() {
    super.onInit();
    measurements.assignAll(allMeasurements);

      // Debounce search query
    _debounceWorker = debounce(searchQuery, (val) {
      filterMeasurements(val);
    }, time: 300.milliseconds);

     // Connect the text controller to the obs
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });

  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    _debounceWorker.dispose();
  }
}
