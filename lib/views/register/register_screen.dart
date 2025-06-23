import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/controllers/register_controller.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/widgets/input_field.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO
              SizedBox(
                height: 34,
                width: 102,
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(height: 60),

              // TITLE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create New Account",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // USERNAME
              InputField(
                hintText: 'Username',
                controller: controller.usernameController,
              ),
              SizedBox(height: 16),

              // EMAIL
              InputField(
                hintText: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(height: 16),

              // PASSWORD
              InputField(
                hintText: 'Password',
                obscureText: controller.isObscure.value,
                controller: controller.pwController,
              ),
              SizedBox(height: 50),

              // BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),

              // HAVE AN ACOUNT?LOG IN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade400,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.inter(
                        color: AppColors.orange,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
