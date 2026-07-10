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
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final token = _readString(data, 'token');
      final mahasiswaId = _readInt(data, 'mahasiswa_id');

      if (token == null) {
        return false;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      if (mahasiswaId != null) {
        await prefs.setInt('mahasiswa_id', mahasiswaId);
      } else {
        await prefs.remove('mahasiswa_id');
      }

      return true;
    }

    return false;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('mahasiswa_id');
  }

  String? _readString(dynamic data, String key) {
    if (data is! Map) return null;

    final value = data[key] ?? data['data']?[key] ?? data['user']?[key];
    return value?.toString();
  }

  int? _readInt(dynamic data, String key) {
    if (data is! Map) return null;

    final value =
        data[key] ??
        data['data']?[key] ??
        data['user']?[key] ??
        data['mahasiswa']?[key];

    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '');
  }
}
