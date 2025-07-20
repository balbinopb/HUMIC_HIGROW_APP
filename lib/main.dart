import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higrow/bindings/initial_binding.dart';
import 'package:higrow/routes/app_pages.dart';
import 'package:higrow/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    );
  }
}
