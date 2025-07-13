import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthServices _authService = AuthServices();

  // Observables
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var isObscure = true.obs;

  // Text controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  /// Check if token exists in secure storage
  void checkLoginStatus() async {
    isLoggedIn.value = await _authService.isLoggedIn();
  }

  /// Login user
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password are required');
      return;
    }

    isLoading.value = true;

    bool success = await _authService.login(email, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }

  /// Register user
  Future<void> register() async {
    print("[DEBUG] AuthController.register() called");

    try {
      final email = emailController.text.trim();
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      print(
        "[DEBUG] Inputs - Email: $email | Username: $username | Password: $password",
      );

      if (email.isEmpty || username.isEmpty || password.isEmpty) {
        print("[DEBUG] Validation failed: empty field");
        Get.snackbar('Error', 'All fields are required');
        return;
      }

      isLoading.value = true;
      print("[DEBUG] isLoading = true");

      final success = await _authService.register(email, username, password);

      print("[DEBUG] AuthServices.register() returned: $success");

      isLoading.value = false;
      print("[DEBUG] isLoading = false");

      if (success) {
        print("[DEBUG] Register success → navigating to BottomNav");
        isLoggedIn.value = true;
        Get.offAllNamed(AppRoutes.bottomNav);
      } else {
        print("[DEBUG] Register failed → show snackbar");
        Get.snackbar('Register Failed', 'Email may already be registered');
      }
    } catch (e, st) {
      isLoading.value = false;
      print("[ERROR] Exception in register(): $e");
      print("[STACKTRACE] $st");
      Get.snackbar('Register Error', e.toString());
    }
  }

  /// Logout user
  Future<void> logout() async {
    await _authService.logout();
    isLoggedIn.value = false;
    clearFields();
    Get.offAllNamed(AppRoutes.login);
  }

  /// Clear all form fields
  void clearFields() {
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
