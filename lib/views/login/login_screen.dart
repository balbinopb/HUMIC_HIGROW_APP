import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/widgets/input_field.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LOGO
                    SizedBox(
                      height: 34,
                      width: 102,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    const SizedBox(height: 60),

                    // TITLE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login to your account",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // EMAIL
                    Obx(
                      () => InputField(
                        hintText: 'Email',
                        controller: controller.emailController,
                        errorText: controller.emailError.value,
                        onChanged: (_) => controller.emailError.value = null,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // PASSWORD
                    Obx(
                      () => InputField(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        obscureText: controller.isObscure.value,
                        errorText: controller.passwordError.value,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          "Log In",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // DON'T HAVE AN ACCOUNT? SIGN UP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.inter(
                            color: AppColors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.register);
                            controller.clearFields();
                          },
                          child: Text(
                            "Sign Up",
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
          ),
        ),
      ),
    );
  }
}
  