import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/routes/app_routes.dart';

class LoginController extends GetxController {
  final isObscure = true.obs;
  final isLoading = false.obs;
  final usernameController = TextEditingController();
  final pwController = TextEditingController();

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = pwController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;

    final auth = Get.find<AuthController>();
    final success = await auth.login(username, password);

    isLoading.value = false;

    if (success) {
      Get.snackbar("Success", "Login successful");
      Get.offAllNamed(AppRoutes.bottomNav);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    pwController.dispose();
    super.onClose();
  }
}
