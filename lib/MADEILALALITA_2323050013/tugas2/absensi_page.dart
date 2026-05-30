import 'package:flutter/material.dart';
import 'detail_page.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> absensi = [

      {
        "tanggal": "20 Mei 2026",
        "matkul": "Pemrograman Mobile",
        "jam": "08:00",
        "status": "Hadir",
      },

      {
        "tanggal": "21 Mei 2026",
        "matkul": "Basis Data",
        "jam": "10:00",
        "status": "Izin",
      },

      {
        "tanggal": "22 Mei 2026",
        "matkul": "Jaringan Komputer",
        "jam": "13:00",
        "status": "Hadir",
      },

      {
        "tanggal": "23 Mei 2026",
        "matkul": "Sistem Operasi",
        "jam": "09:00",
        "status": "Sakit",
      },

      {
        "tanggal": "24 Mei 2026",
        "matkul": "Desain UI/UX",
        "jam": "11:00",
        "status": "Alpa",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Data Absensi'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Riwayat Kehadiran',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Informasi absensi mahasiswa semester aktif',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: absensi.length,

                itemBuilder: (context, index) {

                  final data = absensi[index];

                  Color statusColor;
                  IconData statusIcon;

                  switch (data['status']) {

                    case 'Hadir':
                      statusColor = Colors.green;
                      statusIcon = Icons.check_circle;
                      break;

                    case 'Izin':
                      statusColor = Colors.orange;
                      statusIcon = Icons.info;
                      break;

                    case 'Sakit':
                      statusColor = Colors.blue;
                      statusIcon = Icons.local_hospital;
                      break;

                    default:
                      statusColor = Colors.red;
                      statusIcon = Icons.cancel;
                  }

                  return InkWell(

                    borderRadius: BorderRadius.circular(24),

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            title: data['matkul'],
                            subtitle:
                                'Tanggal : ${data['tanggal']}\n'
                                'Jam : ${data['jam']}\n'
                                'Status : ${data['status']}',
                            icon: statusIcon,
                            color: statusColor,
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
                                const EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              color: statusColor.withValues(
                                alpha: 0.15,
                              ),

                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              statusIcon,
                              color: statusColor,
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
                                  data['tanggal'],
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700,
                                  ),
                                ),

                                Text(
                                  "Jam : ${data['jam']}",
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
                                data['status'],
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight:
                                      FontWeight.bold,
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