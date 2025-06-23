

import 'package:get/get.dart';

class DashboardController extends GetxController{
  var isEnglish=true.obs;

  void toggle(){
    isEnglish.value = !isEnglish.value;
  }

}