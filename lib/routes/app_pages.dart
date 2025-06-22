import 'package:get/get.dart';
import 'package:higrow/bindings/history_binding.dart';
import 'package:higrow/bindings/login_binding.dart';
import 'package:higrow/bindings/register_binding.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/views/history/history_screen.dart';
import 'package:higrow/views/login/login_screen.dart';
import 'package:higrow/views/register/register_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.regsiter,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: AppRoutes.history,
      page: () => HistoryScreen(),
      binding: HistoryBinding(),
    ),
  ];
}
