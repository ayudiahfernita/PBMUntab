import 'package:flutter/material.dart';

class MyStateless extends StatelessWidget {
  const MyStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Materi Stateless'),
        backgroundColor: const Color(0xFF0F766E),
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
              children: const [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Color(0xFF0F766E),
                  child: Icon(Icons.person, size: 54, color: Colors.white),
                ),
                SizedBox(height: 18),
                Text(
                  'NUGRAHA_2323050026',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Mahasiswa yang sedang belajar membuat aplikasi mobile dengan Flutter.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF4B5563), height: 1.5),
                ),
                SizedBox(height: 18),
                _InfoRow(
                  icon: Icons.school,
                  text: 'Mata kuliah: Pemrograman Berbasis Mobile',
                ),
                _InfoRow(
                  icon: Icons.favorite,
                  text: 'Minat: Desain UI dan aplikasi edukasi',
                ),
                _InfoRow(
                  icon: Icons.star,
                  text: 'Target: Membuat aplikasi yang rapi dan berguna',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0F766E)),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
