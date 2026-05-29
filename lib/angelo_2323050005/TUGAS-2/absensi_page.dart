import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> absensi = [
      {"tanggal": "2026-05-20", "status": "Hadir"},
      {"tanggal": "2026-05-21", "status": "Hadir"},
      {"tanggal": "2026-05-22", "status": "Tidak Hadir"},
      {"tanggal": "2026-05-23", "status": "Hadir"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Absensi"),
      ),

      body: ListView.builder(
        itemCount: absensi.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: const Icon(Icons.calendar_month),

            title: Text(absensi[index]['tanggal']),

            subtitle: Text(absensi[index]['status']),
          );
        },
      ),
    );
  }
}