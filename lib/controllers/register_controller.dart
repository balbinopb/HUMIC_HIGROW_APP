import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/routes/app_routes.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final isObscure = true.obs;
  final usernameController = TextEditingController();
  final pwController = TextEditingController();

  Future<void> register() async {
    final username = usernameController.text.trim();
    final password = pwController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    final auth = Get.find<AuthController>();
    final success = await auth.register(username, password);

    if (success) {
      Get.snackbar("Success", "Account created successfully");
      Get.toNamed(AppRoutes.login);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    pwController.dispose();
    super.onClose();
  }
}
