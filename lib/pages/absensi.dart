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
  String? loadingStatus;

  @override
  void initState() {
    super.initState();
    data = service.getAbsensi(1);
  }

  Future<void> submitAbsensi(String status) async {
    setState(() => loadingStatus = status);

    try {
      await service.submitAbsensi(status);

      if (!mounted) return;

      setState(() {
        data = service.getAbsensi(1);
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Absen $status berhasil")));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Absen $status gagal")));
    } finally {
      if (mounted) {
        setState(() => loadingStatus = null);
      }
    }
  }

  Widget buildAbsenButton({
    required String status,
    required IconData icon,
    required Color color,
  }) {
    final isLoading = loadingStatus == status;

    return Expanded(
      child: ElevatedButton.icon(
        onPressed: loadingStatus == null ? () => submitAbsensi(status) : null,
        icon: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(icon),
        label: Text(status.toUpperCase()),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Absensi")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                buildAbsenButton(
                  status: "hadir",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                buildAbsenButton(
                  status: "izin",
                  icon: Icons.event_busy,
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                buildAbsenButton(
                  status: "sakit",
                  icon: Icons.medical_services,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
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
                    final status = item['status']?.toString() ?? '-';
                    final isHadir = status == 'hadir';

                    return Card(
                      child: ListTile(
                        leading: Icon(
                          isHadir ? Icons.check_circle : Icons.cancel,
                          color: isHadir ? Colors.green : Colors.red,
                        ),
                        title: Text(item['mahasiswa']?['nama'] ?? '-'),
                        subtitle: Text(
                          "${item['tanggal'] ?? '-'} - ${item['jam_masuk'] ?? '-'}",
                        ),
                        trailing: Text(status),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
