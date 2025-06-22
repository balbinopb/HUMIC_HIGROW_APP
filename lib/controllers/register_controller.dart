

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  final isObscure=true.obs;
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final pwController=TextEditingController();

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    pwController.dispose();
  }
}