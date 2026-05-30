import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> absensi = [
      {"tanggal": "2026-05-20", "status": "Hadir"},
      {"tanggal": "2026-05-21", "status": "Hadir"},
      {"tanggal": "2026-05-22", "status": "Tidak Hadir"},
      {"tanggal": "2026-05-23", "status": "Hadir"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Absensi'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: absensi.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    absensi[index]['status'] == 'Hadir'
                        ? Colors.green
                        : Colors.red,

                child: Icon(
                  absensi[index]['status'] == 'Hadir'
                      ? Icons.check
                      : Icons.close,
                  color: Colors.white,
                ),
              ),

              title: Text(absensi[index]['tanggal']),
              subtitle: Text(absensi[index]['status']),
            ),
          );
        },
      ),
    );
  }
}