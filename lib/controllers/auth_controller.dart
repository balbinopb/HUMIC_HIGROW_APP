

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:higrow/services/auth_services.dart';

class AuthController extends GetxController {
  final _box = GetStorage();
  var isLoggedIn = false.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final storedToken = _box.read('token');
    if (storedToken != null) {
      token.value = storedToken;
      isLoggedIn.value = true;
    }
  }

  Future<bool> register(String username, String password) async {
    final result = await AuthServices.register(username: username, password: password);
    if (result['success']) {
      token.value = result['data']['token'];
      _box.write('token', token.value);
      isLoggedIn.value = true;
      return true;
    } else {
      Get.snackbar('Register Failed', result['error'] ?? 'Unknown error');
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    final result = await AuthServices.login(username: username, password: password);
    if (result['success']) {
      token.value = result['token'];
      _box.write('token', token.value);
      isLoggedIn.value = true;
      return true;
    } else {
      Get.snackbar('Login Failed', result['error'] ?? 'Unknown error');
      return false;
    }
  }

  void logout() {
    token.value = '';
    isLoggedIn.value = false;
    _box.remove('token');
    Get.offAllNamed('/login');
  }

  String? getToken() {
    return token.value.isNotEmpty ? token.value : null;
  }
}
