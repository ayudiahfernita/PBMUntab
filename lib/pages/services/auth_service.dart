import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "http://ayudiahfernita.com/api";

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    print(response.statusCode);
  print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final token = data['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      return true;
    }

    return false;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}