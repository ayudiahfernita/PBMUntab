import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/nilai.dart';
import '../models/semester.dart';

class NilaiService {
  final String baseUrl = "http://ayudiahfernita.com/api";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<List<Semester>> getSemester() async {
    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/semester"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return (json["data"] as List)
          .map((e) => Semester.fromJson(e))
          .toList();
    }

    throw Exception("Gagal mengambil data semester");
  }


  Future<Map<String, dynamic>> getNilai(int semesterId) async {
    final token = await getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/nilai/$semesterId"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return {
        "semester": json["semester"]["nama"],
        "ip": json["ip"],
        "total_sks": json["total_sks"],
        "data": (json["data"] as List)
            .map((e) => Nilai.fromJson(e))
            .toList(),
      };
    }

    throw Exception("Gagal mengambil nilai");
  }
}