import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/controllers/auth_controller.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/widgets/input_field.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
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

                    // EMAIL
                    InputField(
                      hintText: 'Email',
                      controller: controller.emailController,
                    ),
                    SizedBox(height: 16),

                    // PASSWORD
                    Obx(
                      () => InputField(
                        hintText: 'Password',
                        obscureText: controller.isObscure.value,
                        controller: controller.passwordController,
                      ),
                    ),
                    SizedBox(height: 20),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                            "[DEBUG]========================================BEFORE REGISTER=================================================",
                          );
                          controller.register();
                          print(
                            "[DEBUG]========================================AFTER REGISTER=================================================",
                          );
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
                    SizedBox(height: 30),

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
          ),
        ),
      ),
    );
  }
}
