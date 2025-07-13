import 'package:get/get.dart';
import 'package:higrow/models/user_model.dart';
import '../services/auth_services.dart';

class ProfileController extends GetxController {
  final _authService = AuthServices();

  var user = Rxn<User>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      isLoading.value = true;

      final data = await _authService.getSavedUser();
      if (data != null) {
        user.value = User.fromJson(data);
        print("[DEBUG] Loaded user: ${user.value!.username}");
      } else {
        print("No user data found in storage");
      }
    } catch (e) {
      print("Error loading user: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
