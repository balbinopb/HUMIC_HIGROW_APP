import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class HeightServices {
  static const String baseUrl = "http://10.80.17.100:3000";

  static Future<Map<String, dynamic>> uploadPhoto({
    required Uint8List imageBytes,
    required String token,
  }) async {
    final uri = Uri.parse("$baseUrl/upload-photo");

    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(
        http.MultipartFile.fromBytes('photo', imageBytes, filename: 'photo.jpg'),
      );

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"success": true, "data": jsonDecode(responseBody)};
    } else {
      return {"success": false, "error": jsonDecode(responseBody)['error'] ?? "Upload failed"};
    }
  }

  static Future<Map<String, dynamic>> submitData({
    required String id,
    required String token,
  }) async {
    final uri = Uri.parse("$baseUrl/submit-data");

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"id": id}),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"success": true, "data": responseBody};
    } else {
      return {"success": false, "error": responseBody['error'] ?? "Submit failed"};
    }
  }
}
