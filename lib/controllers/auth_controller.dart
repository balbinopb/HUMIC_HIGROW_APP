import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var isObscure = true.obs;
  var emailError = RxnString();
  var passwordError = RxnString();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    emailController.addListener(() => emailError.value = null);
    passwordController.addListener(() => passwordError.value = null);
  }

  void validateFormFields() {
    emailError.value =
        emailController.text.trim().isEmpty ? 'Email is required' : null;
    passwordError.value =
        passwordController.text.trim().isEmpty ? 'Password is required' : null;
  }

  void checkLoginStatus() async {
    isLoggedIn.value = await _authService.isLoggedIn();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    emailError.value = null;
    passwordError.value = null;

    validateFormFields();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    isLoading.value = true;
    final success = await _authService.login(email, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
      clearFields();
    } else {
      passwordError.value = 'Invalid email or password';
    }
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    emailError.value = null;
    passwordError.value = null;

    validateFormFields();

    if (email.isEmpty || password.isEmpty) {
      return;
    }
    isLoading.value = true;
    final success = await _authService.register(email, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
      clearFields();
    } else {
      emailError.value = 'Email may already be registered';
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    isLoggedIn.value = false;

    await Future.delayed(Duration(milliseconds: 100));
    Get.offAllNamed(AppRoutes.login);
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
