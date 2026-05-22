import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  const Columns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Materi Column'),
        backgroundColor: const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Riwayat Singkat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Contoh ini memakai Column untuk menyusun informasi dari atas ke bawah.',
              style: TextStyle(color: Color(0xFF4B5563)),
            ),
            SizedBox(height: 24),
            _TimelineItem(
              year: '2024',
              title: 'Mulai Belajar Flutter',
              description:
                  'Mengenal widget dasar seperti Text, Container, Row, dan Column.',
              color: Color(0xFF2563EB),
            ),
            _TimelineItem(
              year: '2025',
              title: 'Membuat Tampilan Aplikasi',
              description:
                  'Menyusun halaman dengan Scaffold, AppBar, ListView, dan Navigator.',
              color: Color(0xFFDB2777),
            ),
            _TimelineItem(
              year: '2026',
              title: 'Mengembangkan CV Digital',
              description:
                  'Menggabungkan materi stateless dan stateful menjadi profil interaktif.',
              color: Color(0xFF059669),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.year,
    required this.title,
    required this.description,
    required this.color,
  });

  final String year;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border(left: BorderSide(color: color, width: 6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(color: Color(0xFF4B5563), height: 1.4),
          ),
        ],
      ),
    );
  }
}
