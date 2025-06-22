import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final isObscure = false.obs;
  final usernameController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    pwController.dispose();
  }
}
