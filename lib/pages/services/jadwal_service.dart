import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/jadwal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalService {
  static const String baseUrl =
      "http://ayudiahfernita.com/api/jadwal-kuliah";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, List<Jadwal>>> getJadwal() async {

    final token = await getToken();
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final Map<String, dynamic> data = json["data"];

      Map<String, List<Jadwal>> result = {};

      data.forEach((hari, value) {
        result[hari] = (value as List)
            .map((e) => Jadwal.fromJson(e))
            .toList();
      });

     

      return result;
    }

     print(response.statusCode);
      print(response.body);

    throw Exception("Gagal mengambil data");
  }
}