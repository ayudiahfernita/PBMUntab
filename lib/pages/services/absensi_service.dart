import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiService {
  final String baseUrl = "https://ayudiahfernita.com/api";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<dynamic>> getAbsensi(int mahasiswaId) async {
    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/absensi/$mahasiswaId"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token", // 👈 INI PENTING
      },
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil data absensi");
    }
  }
}