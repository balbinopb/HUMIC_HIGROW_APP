import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:higrow/bindings/initial_binding.dart';
import 'package:higrow/constants/app_colors.dart';
import 'package:higrow/routes/app_pages.dart';
import 'package:higrow/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, 
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}
