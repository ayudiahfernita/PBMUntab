import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> jadwal = [
      {
        "hari": "Senin",
        "matkul": "Pemrograman Mobile",
        "jam": "08:00 - 10:00",
        "ruangan": "Lab Komputer 1",
      },
      {
        "hari": "Selasa",
        "matkul": "Basis Data",
        "jam": "10:00 - 12:00",
        "ruangan": "Ruang A2",
      },
      {
        "hari": "Rabu",
        "matkul": "Jaringan Komputer",
        "jam": "13:00 - 15:00",
        "ruangan": "Lab Jaringan",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Jadwal Kuliah'),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: jadwal.length,

        itemBuilder: (context, index) {

          final data = jadwal[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  data['matkul'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text("Hari : ${data['hari']}"),
                Text("Jam : ${data['jam']}"),
                Text("Ruangan : ${data['ruangan']}"),
              ],
            ),
          );
        },
      ),
    );
  }
}