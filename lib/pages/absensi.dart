import 'package:flutter/material.dart';
import 'services/absensi_service.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  final service = AbsensiService();
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = service.getAbsensi(1); // ganti mahasiswa_id
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Absensi")),
      body: FutureBuilder<List<dynamic>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final absensi = snapshot.data ?? [];

          return ListView.builder(
            itemCount: absensi.length,
            itemBuilder: (context, index) {
              final item = absensi[index];

              return Card(
                child: ListTile(
                  leading: Icon(
                    item['status'] == 'hadir'
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: item['status'] == 'hadir'
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text(item['mahasiswa']['nama']),
                  subtitle: Text(
                    "${item['tanggal']} - ${item['jam_masuk']}",
                  ),
                  trailing: Text(item['status']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}