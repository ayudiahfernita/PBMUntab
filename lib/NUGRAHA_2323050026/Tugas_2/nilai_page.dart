import 'package:flutter/material.dart';

import 'widgets/untab_logo.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  static final List<Map<String, dynamic>> daftarNilai = [
    {
      'mata_kuliah': 'Pemrograman Berbasis Mobile',
      'uts': 82,
      'uas': 88,
      'tugas': 90,
    },
    {
      'mata_kuliah': 'Basis Data',
      'uts': 78,
      'uas': 85,
      'tugas': 80,
    },
    {
      'mata_kuliah': 'Algoritma & Struktur Data',
      'uts': 75,
      'uas': 80,
      'tugas': 85,
    },
    {
      'mata_kuliah': 'Jaringan Komputer',
      'uts': 70,
      'uas': 76,
      'tugas': 78,
    },
  ];

  static double _rata(int uts, int uas, int tugas) =>
      (uts + uas + tugas) / 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: daftarNilai.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Nilai',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Nilai UTS, UAS, dan Tugas (data dummy)',
                      style: TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              );
            }

            final item = daftarNilai[index - 1];
            final uts = item['uts'] as int;
            final uas = item['uas'] as int;
            final tugas = item['tugas'] as int;
            final rata = _rata(uts, uas, tugas);

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                    item['mata_kuliah'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _NilaiBadge(label: 'UTS', nilai: uts),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _NilaiBadge(label: 'UAS', nilai: uas),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _NilaiBadge(label: 'Tugas', nilai: tugas),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey.shade200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rata-rata',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        rata.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: UntabLogo.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NilaiBadge extends StatelessWidget {
  const _NilaiBadge({required this.label, required this.nilai});

  final String label;
  final int nilai;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB8D4F0)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: UntabLogo.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$nilai',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }
}
