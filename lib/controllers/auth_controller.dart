import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var isObscure = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    isLoggedIn.value = await _authService.isLoggedIn();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password are required');
      return;
    }

    isLoading.value = true;
    final success = await _authService.login(email, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password are required');
      return;
    }
    isLoading.value = true;
    final success = await _authService.register(email, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar('Register Failed', 'Email may already be registered');
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    isLoggedIn.value = false;
    clearFields();
    Get.offAllNamed(AppRoutes.login);
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
