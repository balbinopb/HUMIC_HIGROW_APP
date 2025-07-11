// import 'package:get/get.dart';
// import 'package:higrow/services/height_services.dart';

// class HeightRecordController extends GetxController {
//   final records = <Map<String, dynamic>>[].obs;
//   final isLoading = false.obs;

//   Future<void> fetchRecords() async {
//     isLoading.value = true;
//     final data = await HeightServices.listRecords();
//     records.assignAll(data);
//     isLoading.value = false;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecords();
//   }
// }
