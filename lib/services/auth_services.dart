import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  static final BASE_URL = "http://10.80.17.100:3000/api/auth";


// register 
  static Future<Map<String, dynamic>> register({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse("$BASE_URL/register");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password
        }),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "error": data['error'] ?? "Registration failed"};
    }
  }

// login
static Future<Map<String, dynamic>> login({
  required String username,
  required String password,
}) async {
  final url = Uri.parse("$BASE_URL/login");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": username, "password": password}),
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return {"success": true, "token": data['token']};
  } else {
    return {"success": false, "error": data['error'] ?? "Login failed"};
  }
}

}
