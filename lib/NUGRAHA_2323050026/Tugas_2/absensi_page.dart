import 'package:flutter/material.dart';

import 'widgets/untab_logo.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  static final List<Map<String, dynamic>> absensi = [
    {'tanggal': '2026-05-20', 'status': 'Hadir'},
    {'tanggal': '2026-05-21', 'status': 'Hadir'},
    {'tanggal': '2026-05-22', 'status': 'Tidak Hadir'},
    {'tanggal': '2026-05-23', 'status': 'Hadir'},
    {'tanggal': '2026-05-24', 'status': 'Hadir'},
    {'tanggal': '2026-05-25', 'status': 'Tidak Hadir'},
    {'tanggal': '2026-05-26', 'status': 'Hadir'},
    {'tanggal': '2026-05-27', 'status': 'Hadir'},
  ];

  @override
  Widget build(BuildContext context) {
    final hadir = absensi.where((e) => e['status'] == 'Hadir').length;
    final tidakHadir = absensi.length - hadir;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Riwayat Absensi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Data kehadiran (dummy)',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryChip(
                          label: 'Hadir',
                          count: hadir,
                          color: UntabLogo.primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SummaryChip(
                          label: 'Tidak Hadir',
                          count: tidakHadir,
                          color: const Color(0xFFDC2626),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: absensi.length,
                itemBuilder: (context, index) {
                  final item = absensi[index];
                  final isHadir = item['status'] == 'Hadir';
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isHadir
                            ? const Color(0xFFE3EDFA)
                            : const Color(0xFFFEE2E2),
                        child: Icon(
                          isHadir ? Icons.check_circle : Icons.cancel,
                          color: isHadir
                              ? UntabLogo.primaryBlue
                              : const Color(0xFFDC2626),
                        ),
                      ),
                      title: Text(
                        item['tanggal'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isHadir
                              ? UntabLogo.primaryBlue
                              : const Color(0xFFDC2626),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item['status'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
