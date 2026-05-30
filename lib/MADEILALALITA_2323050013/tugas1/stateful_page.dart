import 'package:flutter/material.dart';

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({super.key});

  @override
  State<MyStatefulPage> createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  int volume = 1;
  String materialSelected = 'Beton Ready-Mix K-350';

  // Daftar harga acuan resmi
  final Map<String, int> listLogistik = {
    'Beton Ready-Mix K-350': 2500000,
    'Baja Tulangan Ulir D-16': 4800000,
    'Pasir Pasang / Truk Rit': 1200000,
  };

  @override
  Widget build(BuildContext context) {
    int hargaSatuan = listLogistik[materialSelected] ?? 0;
    int finalBiaya = volume * hargaSatuan;

    return Scaffold(
      backgroundColor: const Color(0xff090d16), // Dark Space Obsidian
      appBar: AppBar(
        title: const Text('SIMULASI ANGGARAN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xff0f172a),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text('Kalkulator Biaya Kontrak PO', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          const Text('Hitung instan estimasi pengadaan material struktur secara real-time.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 24),
          
          // 1. DROPDOWN MATERIAL CYBER
          const Text('PILIH KOMODITAS MATERIAL', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02), 
              borderRadius: BorderRadius.circular(16), 
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: materialSelected,
                isExpanded: true,
                dropdownColor: const Color(0xff0f172a),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.cyan),
                items: listLogistik.keys.map((String val) {
                  return DropdownMenuItem(value: val, child: Text(val));
                }).toList(),
                onChanged: (newVal) {
                  if (newVal != null) {
                    setState(() {
                      materialSelected = newVal;
                    });
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 2. PANEL PENGATUR JUMLAH VOLUME
          const Text('TENTUKAN VOLUME KUANTITAS', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.01), 
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              children: [
                Text(
                  'Harga Satuan: Rp $hargaSatuan', 
                  style: const TextStyle(color: Colors.cyan, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5)
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (volume > 1) {
                          setState(() { volume--; });
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    Text('$volume', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                    InkWell(
                      onTap: () {
                        setState(() { volume++; });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.cyan.withOpacity(0.2), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.cyan.withOpacity(0.5))),
                        child: const Icon(Icons.add, color: Colors.cyan),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // 3. BOX INVOICE AMAN (REGULER STRING CONVERSION)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff0f172a), Color(0xff1e1e38)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ), 
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.cyan.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ESTIMASI NILAI PENGADAAN (PO)', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                const SizedBox(height: 10),
                
                // DATA ANGKA UTAMA DIJAMIN MUNCUL NORMAL
                Text(
                  'Rp $finalBiaya',
                  style: const TextStyle(color: Color(0xff22c55e), fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 0.5), 
                ),
                
                const Divider(color: Colors.white10, height: 24),
                Text(
                  'Kalkulasi: $volume Unit × Rp $hargaSatuan', 
                  style: const TextStyle(color: Colors.grey, fontSize: 11, fontStyle: FontStyle.italic)
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
