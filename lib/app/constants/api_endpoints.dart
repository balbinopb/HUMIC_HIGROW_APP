import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String baseUrl = dotenv.env["API_URL"] ?? "";

  static final String authLogin = "$baseUrl/api/auth/login";
  static final String authRegister = "$baseUrl/api/auth/register";
  static final String profile = "$baseUrl/api/auth/profile";

  static final String heightUploadPhoto = "$baseUrl/api/height/upload-photo";
  static final String heightSubmitData = "$baseUrl/api/height/submit-data";
  static final String heightRecords = "$baseUrl/api/height/records";
}