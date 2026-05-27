import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  void _openDetail(BuildContext context, String title, String code, String coreSpecs, List<String> workflows, Color neonColor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: const Color(0xff090d16), 
          appBar: AppBar(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
            backgroundColor: const Color(0xff0f172a),
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: neonColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: neonColor.withOpacity(0.5))),
                      child: Text('MODUL UTAMA: $code', style: TextStyle(color: neonColor, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                    ),
                    const Text('STATUS: AKTIF', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 24),
                
                const Text('DESKRIPSI OPERASIONAL', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Text(coreSpecs, style: const TextStyle(color: Color(0xff94a3b8), fontSize: 14, height: 1.6)),
                ),
                const SizedBox(height: 24),

                const Text('ALUR EKSEKUSI DIGITAL', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                const SizedBox(height: 12),
                Column(
                  children: workflows.map((step) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.01),
                      borderRadius: BorderRadius.circular(12),
                      border: Border(left: BorderSide(color: neonColor, width: 3)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.terminal_rounded, color: neonColor, size: 16),
                        const SizedBox(width: 12),
                        Expanded(child: Text(step, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500))),
                      ],
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d16),
      appBar: AppBar(
        title: const Text('KATALOG TEKNOLOGI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xff0f172a),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text('Sistem Konstruksi Terintegrasi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          const Text('Ketuk modul untuk memuat sistem visualisasi matriks data.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 24),

          _buildCyberCard(
            context, 'MOD-01', 'Konstruksi Infrastruktur Berat', 
            'Pengerjaan fondasi makro sipil, struktur megaproyek bertingkat, dan jembatan prategang.', 
            const Color(0xffef4444), Icons.hourglass_empty_rounded,
            'Divisi konstruksi utama CV DHELATA GRUP mengintegrasikan sistem perhitungan teknik sipil komputerisasi pra-pembangunan guna menekan margin error struktur nol persen di area berisiko seismik.',
            ['Pemodelan Analisis Elemen Hingga Struktur', 'Metode Pengecoran Massal Berkelanjutan', 'Sertifikasi Uji Beban Fisik Akhir Makro']
          ),
          const SizedBox(height: 14),
          _buildCyberCard(
            context, 'MOD-02', 'Rantai Pasok Logistik Otomatis SNI', 
            'Penyediaan agregat beton ready-mix, baja tulangan kustom, dan material berlisensi laboratorium.', 
            const Color(0xff22c55e), Icons.data_saver_on_rounded,
            'Pengelolaan supply-chain logistik material berbasis komoditas tangan pertama dengan dukungan armada truk mixer sensoris guna menjamin pengiriman tanpa jeda operasional harian.',
            ['Inspeksi Uji Mutu Laboratorium Komoditas', 'Manajemen Distribusi Armada Terjadwal Gps', 'Sertifikasi Pemenuhan Standar Mutu SNI']
          ),
          const SizedBox(height: 14),
          _buildCyberCard(
            context, 'MOD-03', 'Virtualisasi Arsitektur 3D', 
            'Studio transformasi ide bangunan lewat blueprint digital CAD dan animasi render sinematik 4K.', 
            const Color(0xff3b82f6), Icons.layers_rounded,
            'Sistem simulasi spasial arsitektur modern untuk menyelaraskan aspek estetika fasad luar dengan fungsionalitas ruang fisik rill melalui kalkulasi anggaran RAB yang transparan.',
            ['Penyusunan Gambar Kerja CAD Arsitektural', 'Rendering Imersif Animasi Sinematik 4K', 'Penyusunan Rencana Anggaran Biaya Ekonomis']
          ),
        ],
      ),
    );
  }

  Widget _buildCyberCard(BuildContext context, String code, String title, String desc, Color neonColor, IconData icon, String coreSpecs, List<String> workflows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: neonColor.withOpacity(0.15)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => _openDetail(context, title, code, coreSpecs, workflows, neonColor),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(code, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: neonColor, letterSpacing: 1.0)),
                    Icon(icon, color: neonColor, size: 20),
                  ],
                ),
                const SizedBox(height: 12),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 6),
                Text(desc, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.4)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Text('AKSES SISTEM DATA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: neonColor, letterSpacing: 0.5)),
                    const SizedBox(width: 6),
                    Icon(Icons.arrow_right_alt_rounded, size: 14, color: neonColor),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
