import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Row Widget', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.tealAccent,
                    child: Icon(Icons.person, color: Colors.black, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Angelo', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('2323050005', style: TextStyle(color: Colors.tealAccent, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Contoh Row Layout', style: TextStyle(color: Colors.white54, fontSize: 13)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _box('A', Colors.tealAccent),
                _box('B', Colors.blueAccent),
                _box('C', Colors.purpleAccent),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Row dengan Icon', style: TextStyle(color: Colors.white54, fontSize: 13)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _iconInfo(Icons.school, 'Kampus', 'Universitas Tabanan'),
                  _iconInfo(Icons.calendar_today, 'Angkatan', '2023'),
                  _iconInfo(Icons.code, 'Prodi', 'Sistem Informasi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(String label, Color color) {
    return Container(
      width: 90, height: 90,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        border: Border.all(color: color.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(label, style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _iconInfo(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.tealAccent, size: 28),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}