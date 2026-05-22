import 'package:flutter/material.dart';

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<MyStateful> createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  int projectCount = 1;

  void tambahProject() {
    setState(() {
      projectCount++;
    });
  }

  void kurangiProject() {
    if (projectCount == 0) {
      return;
    }

    setState(() {
      projectCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Materi Stateful'),
        backgroundColor: const Color(0xFFEA580C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.task_alt, size: 58, color: Color(0xFFEA580C)),
                const SizedBox(height: 14),
                const Text(
                  'Project Flutter NUGRAHA_2323050026',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'StatefulWidget dipakai karena angka project bisa berubah saat tombol ditekan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF4B5563), height: 1.5),
                ),
                const SizedBox(height: 28),
                Text(
                  '$projectCount',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEA580C),
                  ),
                ),
                const Text('Project latihan selesai'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: kurangiProject,
                      icon: const Icon(Icons.remove),
                      label: const Text('Kurang'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B7280),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: tambahProject,
                      icon: const Icon(Icons.add),
                      label: const Text('Tambah'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEA580C),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
