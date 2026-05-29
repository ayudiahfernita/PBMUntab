import 'package:flutter/material.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  final List<Map<String, dynamic>> daftarMahasiswa = const [
    {
      "nama": "I Made Adi Wijaya",
      "nim": "2323050001",
      "nilai": "Nilai A",
    },
    {
      "nama": "Ni Putu Ayu Lestari",
      "nim": "2323050002",
      "nilai": "Nilai A",
    },
    {
      "nama": "Kadek Surya Wijaya",
      "nim": "2323050003",
      "nilai": "Nilai A",
    },
    {
      "nama": "Komang Yoga Pratama",
      "nim": "2323050004",
      "nilai": "Nilai A",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Nilai Mahasiswa"),
        backgroundColor: Colors.green,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarMahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = daftarMahasiswa[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      mhs['nama'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "NIM: ${mhs['nim']}",
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Text(
                    mhs['nilai'],
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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