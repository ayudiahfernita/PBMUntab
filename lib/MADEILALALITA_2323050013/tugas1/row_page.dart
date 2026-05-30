import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  void _showCyberReport(BuildContext context, String section, String metric, String detailLog, Color neonColor) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff090d16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics_rounded, color: neonColor),
                const SizedBox(width: 10),
                Text('AUDIT SISTEM: $section', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
              ],
            ),
            const Divider(height: 30, color: Colors.white10),
            Text('Indeks Performa Terbaca: $metric', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: neonColor)),
            const SizedBox(height: 12),
            Text(detailLog, style: const TextStyle(fontSize: 13, color: Color(0xff94a3b8), height: 1.5)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d16),
      appBar: AppBar(
        title: const Text('METRIK STATISTIK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xff0f172a),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text('Pencapaian Kinerja Riil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          const Text('Klik pada kluster parameter untuk memuat visualisasi audit formal.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 24),

          Row(
            children: [
              _buildNeonMetricCard(context, '150+', 'PROYEK', 'Total megaproyek konstruksi sipil, infrastruktur, dan jembatan skala nasional.', [const Color(0xfff87171), const Color(0xffef4444)]),
              const SizedBox(width: 10),
              _buildNeonMetricCard(context, '50+', 'MITRA', 'Kerjasama eksklusif terintegrasi jangka panjang bersama korporasi swasta dan BUMN.', [const Color(0xff4ade80), const Color(0xff22c55e)]),
              const SizedBox(width: 10),
              _buildNeonMetricCard(context, '99%', 'INDEKS', 'Tingkat kepuasan jaminan material bermutu SNI dan kekokohan fisik bangunan.', [const Color(0xff60a5fa), const Color(0xff3b82f6)]),
            ],
          ),
          const SizedBox(height: 32),

          const Text('DIAGRAM PERTUMBUHAN STRUKTUR', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.01), borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.white.withOpacity(0.05))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildCyberBar('KUARTAL I', 50, const Color(0xffef4444)),
                _buildCyberBar('KUARTAL II', 75, const Color(0xff22c55e)),
                _buildCyberBar('KUARTAL III', 100, const Color(0xff3b82f6)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNeonMetricCard(BuildContext context, String val, String label, String details, List<Color> gradient) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: gradient.first.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _showCyberReport(context, label, val, details, gradient.last),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(label, style: const TextStyle(fontSize: 11, color: Colors.white70, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCyberBar(String title, double height, Color neonColor) {
    return Column(
      children: [
        Container(
          height: height,
          width: 55,
          decoration: BoxDecoration(
            color: neonColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border(top: BorderSide(color: neonColor, width: 4)),
          ),
          child: Center(child: Text('${height.toInt()}%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: neonColor))),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
