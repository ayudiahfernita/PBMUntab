import 'package:flutter/material.dart';

class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> tugas = [
      {
        "judul": "UI Flutter",
        "deadline": "30 Mei 2026",
        "status": "Belum Selesai",
      },
      {
        "judul": "Database MySQL",
        "deadline": "2 Juni 2026",
        "status": "Selesai",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Daftar Tugas'),
        backgroundColor: Colors.teal,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: tugas.length,

        itemBuilder: (context, index) {

          final data = tugas[index];

          bool selesai =
              data['status'] == 'Selesai';

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

            child: Row(
              children: [

                Icon(
                  selesai
                      ? Icons.check_circle
                      : Icons.pending,
                  color:
                      selesai ? Colors.green : Colors.orange,
                  size: 40,
                ),

                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        data['judul'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Deadline: ${data['deadline']}",
                      ),

                      Text(
                        data['status'],
                        style: TextStyle(
                          color: selesai
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}