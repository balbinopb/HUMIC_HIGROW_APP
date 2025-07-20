import 'package:get/get.dart';
import 'package:higrow/bindings/bottom_nav_binding.dart';
import 'package:higrow/bindings/cam_binding.dart';
import 'package:higrow/bindings/history_binding.dart';
import 'package:higrow/bindings/profile_binding.dart';
import 'package:higrow/routes/app_routes.dart';
import 'package:higrow/views/bottom/bottom_nav_screen.dart';
import 'package:higrow/views/camera/camera_screen.dart';
import 'package:higrow/views/history/history_screen.dart';
import 'package:higrow/views/login/login_screen.dart';
import 'package:higrow/views/profile/profile_screen.dart';
import 'package:higrow/views/register/register_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => BottomNavScreen(),
      binding: BottomNavBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.history,
      page: () => HistoryScreen(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.cam,
      page: () => CameraScreen(),
      binding: CamBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    
  ];
}
