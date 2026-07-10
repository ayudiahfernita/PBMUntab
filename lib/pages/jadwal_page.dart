import 'package:flutter/material.dart';

import '/pages/models/jadwal.dart';
import '/pages/services/jadwal_service.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  late Future<Map<String, List<Jadwal>>> futureJadwal;

  @override
  void initState() {
    super.initState();
    futureJadwal = JadwalService().getJadwal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jadwal Kuliah"),
      ),
      body: FutureBuilder<Map<String, List<Jadwal>>>(
        future: futureJadwal,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Tidak ada jadwal"),
            );
          }

          final data = snapshot.data!;

          return ListView(
            children: data.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    color: Colors.green.shade700,
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ...entry.value.map((jadwal) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 2,
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.schedule),
                        ),
                        title: Text(jadwal.mataKuliah),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text("👨‍🏫 ${jadwal.dosen}"),
                            Text("🎓 ${jadwal.semester}"),
                            Text(
                              "🕒 ${jadwal.jamMulai} - ${jadwal.jamSelesai}",
                            ),
                            Text("📍 ${jadwal.ruangan}"),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}