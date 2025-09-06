import 'dart:convert';
import 'dart:io';
import 'package:higrow/models/height_record.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HeightServices {
  final String baseUrl = 'http://172.20.10.2:3000/api/height';

  Future<String?> uploadAndPredict(File file) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found. Please log in again.');
    }

    final uriUpload = Uri.parse('$baseUrl/upload-photo');
    final uriSubmit = Uri.parse('$baseUrl/submit-data');

    try {
      var request = http.MultipartRequest('POST', uriUpload);
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('photo', file.path));

      final uploadResponse = await request.send();
      final resBody = await uploadResponse.stream.bytesToString();

      if (uploadResponse.statusCode != 200) {
        throw Exception('Upload failed: $resBody');
      }

      final uploadData = jsonDecode(resBody);
      final id = uploadData['id'];

      final submitRes = await http.post(
        uriSubmit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'id': id}),
      );

      if (submitRes.statusCode == 200) {
        final result = jsonDecode(submitRes.body);
        return "${result["height_cm"]} cm";
      } else {
        throw Exception('Submit failed: ${submitRes.body}');
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<List<HeightRecord>> fetchRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) throw Exception("Token not found.");

    final response = await http.get(
      Uri.parse('$baseUrl/records'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => HeightRecord.fromJson(item)).toList();
    } else {
      throw Exception("Failed to fetch records: ${response.body}");
    }
  }

  
}
