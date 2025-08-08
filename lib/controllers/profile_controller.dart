import 'package:get/get.dart';
import 'package:higrow/services/auth_services.dart';

class ProfileController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;

  String get username {
    final email = userProfile['email'] ?? '';
    final name = email.contains('@') ? email.split('@')[0] : '';//pior @mgail.com
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
