import 'package:flutter/material.dart';
import 'detail_page.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> nilaiList = [

      {
        "matkul": "Pemrograman Mobile",
        "tugas": "95",
        "uts": "88",
        "uas": "90",
        "akhir": "91",
        "grade": "A",
        "color": Colors.blue,
      },

      {
        "matkul": "Basis Data",
        "tugas": "90",
        "uts": "85",
        "uas": "89",
        "akhir": "88",
        "grade": "A",
        "color": Colors.green,
      },

      {
        "matkul": "Jaringan Komputer",
        "tugas": "87",
        "uts": "82",
        "uas": "85",
        "akhir": "85",
        "grade": "B+",
        "color": Colors.orange,
      },

      {
        "matkul": "Sistem Operasi",
        "tugas": "92",
        "uts": "90",
        "uas": "93",
        "akhir": "92",
        "grade": "A",
        "color": Colors.purple,
      },

      {
        "matkul": "Desain UI/UX",
        "tugas": "98",
        "uts": "94",
        "uas": "96",
        "akhir": "96",
        "grade": "A+",
        "color": Colors.red,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Daftar Nilai'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Nilai Akademik',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Informasi nilai seluruh mata kuliah',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF9500),
                    Color(0xFFFFC46B),
                  ],
                ),
              ),

              child: const Column(
                children: [

                  Text(
                    'IP Semester',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    '3.85',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: nilaiList.length,

                itemBuilder: (context, index) {

                  final data = nilaiList[index];

                  return InkWell(

                    borderRadius: BorderRadius.circular(24),

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            title: data['matkul'],
                            subtitle:
                                'Nilai Tugas : ${data['tugas']}\n'
                                'Nilai UTS : ${data['uts']}\n'
                                'Nilai UAS : ${data['uas']}\n'
                                'Nilai Akhir : ${data['akhir']}\n'
                                'Grade : ${data['grade']}',
                            icon: Icons.school,
                            color: data['color'],
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 18),

                      padding: const EdgeInsets.all(22),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(24),

                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withValues(
                              alpha: 0.05,
                            ),

                            blurRadius: 10,

                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [

                          Container(
                            padding:
                                const EdgeInsets.all(16),

                            decoration: BoxDecoration(
                              color: data['color']
                                  .withValues(alpha: 0.15),

                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              Icons.school,
                              color: data['color'],
                              size: 34,
                            ),
                          ),

                          const SizedBox(width: 18),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  data['matkul'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "Nilai Akhir : ${data['akhir']}",
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700,
                                  ),
                                ),

                                Text(
                                  "Grade : ${data['grade']}",
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: [

                              Text(
                                data['grade'],
                                style: TextStyle(
                                  color: data['color'],
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}