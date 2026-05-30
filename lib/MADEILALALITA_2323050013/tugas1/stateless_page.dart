import 'package:flutter/material.dart';

class MyStatelessPage extends StatelessWidget {
  const MyStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d16), // Tema Gelap Obsidian
      appBar: AppBar(
        title: const Text('PROFIL & LEGALITAS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xff0f172a),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // LOGO UTAMA
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.02), 
                    shape: BoxShape.circle, 
                    border: Border.all(color: const Color(0xff3b82f6).withOpacity(0.3)),
                  ),
                  child: const Icon(Icons.shield_rounded, color: Color(0xff3b82f6), size: 40),
                ),
                const SizedBox(height: 14),
                const Text('CV DHELATA GRUP', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text('Kontraktor Umum & Rantai Pasok Terverifikasi', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // TABEL DAFTAR HARGA ACUAN RESMI
          const Text('DAFTAR HARGA ACUAN MATERIAL DASAR', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.01), 
              borderRadius: BorderRadius.circular(20), 
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              children: [
                _buildHargaRow('Beton Ready-Mix K-350', 'Rp 2.500.000 / m³', const Color(0xffef4444)),
                const Divider(height: 24, color: Colors.white10),
                _buildHargaRow('Baja Tulangan Ulir D-16', 'Rp 4.800.000 / Ton', const Color(0xff22c55e)),
                const Divider(height: 24, color: Colors.white10),
                _buildHargaRow('Pasir Pasang / Truk Rit', 'Rp 1.200.000 / Rit', const Color(0xff3b82f6)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // VALIDASI HUKUM YURIDIS
          const Text('DOKUMEN VALIDASI OTORISASI', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          _buildLegalBox('Nomor Induk Berusaha (NIB)', '91203011402219'),
          _buildLegalBox('Izin Usaha Jasa Konstruksi (SIUJK)', 'No. 024/SIUJK/XI/2023'),
        ],
      ),
    );
  }

  // FUNGSI PEMBANTU BARIS HARGA
  Widget _buildHargaRow(String nama, String harga, Color warnaNeon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 6, height: 6, decoration: BoxDecoration(color: warnaNeon, shape: BoxShape.circle)),
            const SizedBox(width: 12),
            Text(nama, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
          ],
        ),
        Text(harga, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: warnaNeon, letterSpacing: 0.5)),
      ],
    );
  }

  // FUNGSI PEMBANTU KOTAK LEGALITAS
  Widget _buildLegalBox(String judul, String nomor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.01), 
        borderRadius: BorderRadius.circular(16), 
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          const Icon(Icons.fingerprint_rounded, color: Colors.grey, size: 20),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 2),
                Text(nomor, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
