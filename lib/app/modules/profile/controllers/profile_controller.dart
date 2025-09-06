import 'package:get/get.dart';
import 'package:higrow/app/data/services/auth_services.dart';
import 'package:higrow/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  final isLoggedIn=false.obs;

  String get username {
    final email = userProfile['email'] ?? '';
    final name = email.contains('@') ? email.split('@')[0] : '';
    return name.isNotEmpty ? name[0].toUpperCase() + name.substring(1) : '';
  }

  String get email {
    final email = userProfile['email'] ?? '';
    return email;
  }

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

    Future<void> logout() async {
    await _authServices.logout();
    isLoggedIn.value = false;

    await Future.delayed(Duration(milliseconds: 100));
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> loadProfile() async {
    final token = await _authServices.getToken();
    if (token != null) {
      final profile = await _authServices.getProfile(token);
      if (profile != null) {
        userProfile.value = profile;
      }
    }
  }


}
