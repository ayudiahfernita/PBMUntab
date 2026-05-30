import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  const Rows({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Materi Row'),
        backgroundColor: const Color(0xFF1D4ED8),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skill Utama NUGRAHA_2323050026',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Contoh ini memakai Row untuk menyusun kartu skill secara mendatar.',
              style: TextStyle(color: Color(0xFF4B5563)),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: _SkillCard(
                    icon: Icons.phone_android,
                    title: 'Flutter',
                    color: Color(0xFF2563EB),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _SkillCard(
                    icon: Icons.palette,
                    title: 'UI Design',
                    color: Color(0xFFDB2777),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _SkillCard(
                    icon: Icons.code,
                    title: 'Coding',
                    color: Color(0xFF059669),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Text(
                'Row cocok dipakai saat widget perlu berjajar dari kiri ke kanan, '
                'misalnya menu, tombol aksi, atau daftar skill seperti ini.',
                style: TextStyle(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
