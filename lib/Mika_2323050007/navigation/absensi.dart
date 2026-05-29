import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      appBar: AppBar(
        title: const Text(
          "Data Absensi",

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),

        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          buildAbsensi("Pemrograman Mobile", "Hadir"),
          buildAbsensi("Basis Data", "Hadir"),
          buildAbsensi("Jaringan Komputer", "Izin"),
          buildAbsensi("Kecerdasan Buatan", "Hadir"),
        ],
      ),
    );
  }

  Widget buildAbsensi(String matkul, String status) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(matkul),
        subtitle: Text("Status: $status"),
      ),
    );
  }
}
