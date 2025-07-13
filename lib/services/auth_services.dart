import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {
  final String baseUrl = 'http://10.110.0.145:3000/api/auth';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // Register user
  Future<bool> register(String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await secureStorage.write(key: 'token', value: data['token']);
      await secureStorage.write(key: 'user', value: jsonEncode(data['user']));
      print('[DEBUG] Registered user: ${data['user']}');
      return true;
    } else {
      print('Register failed: ${response.body}');
      return false;
    }
  }

  // Login user
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await secureStorage.write(key: 'token', value: data['token']);
      await secureStorage.write(key: 'user', value: jsonEncode(data['user']));
      print('[DEBUG] Logged in user: ${data['user']}');
      return true;
    } else {
      print('Login failed: ${response.body}');
      return false;
    }
  }

  // Get saved user
  Future<Map<String, dynamic>?> getSavedUser() async {
    final userJson = await secureStorage.read(key: 'user');
    if (userJson == null) return null;
    return jsonDecode(userJson);
  }

  // Logout
  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'user');
  }

  // Get saved token
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await secureStorage.read(key: 'token');
    return token != null;
  }
}
