import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:higrow/app/data/services/auth_services.dart';
import 'package:higrow/app/routes/app_pages.dart';

class LoginController extends GetxController {
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
      Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      clearFields();
    } else {
      passwordError.value = 'Invalid email or password';
    }
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
