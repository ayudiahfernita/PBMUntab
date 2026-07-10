import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiService {
  final String baseUrl = "http://ayudiahfernita.com/api";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<dynamic>> getAbsensi(int mahasiswaId) async {
    final token = await getToken();
    final prefs = await SharedPreferences.getInstance();
    final savedMahasiswaId = prefs.getInt('mahasiswa_id') ?? mahasiswaId;

    final response = await http.get(
      Uri.parse("$baseUrl/absensi/$savedMahasiswaId"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token", // 👈 INI PENTING
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil data absensi");
    }
  }

  Future<void> submitAbsensi(String status) async {
    final token = await getToken();
    final prefs = await SharedPreferences.getInstance();
    final mahasiswaId = prefs.getInt('mahasiswa_id');

    final body = <String, dynamic>{
      "status": status,
      ?"mahasiswa_id": mahasiswaId,
    };

    final response = await http.post(
      Uri.parse("$baseUrl/absensi"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Gagal absen $status");
    }
  }
}
