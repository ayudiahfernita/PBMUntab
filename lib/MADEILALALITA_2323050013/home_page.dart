import 'package:flutter/material.dart';
import 'column_page.dart';
import 'row_page.dart';
import 'stateless_page.dart';
import 'stateful_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // PUSAT NOTIFIKASI INTERAKTIF
  void _openAdvancedNotificationCenter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff090d16),
      elevation: 20,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(28.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.cyan.withOpacity(0.2), width: 1.5),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: const Color(0xfff59e0b).withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.bolt_rounded, color: Color(0xfff59e0b), size: 24),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        'LOG TELEMETRI LANGSUNG', 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white60),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const Divider(height: 30, color: Colors.white10),
              _buildCyberNotificationItem(
                'SINKRONISASI LOGISTIK BERHASIL',
                'Simulasi anggaran otomatis pada menu Stateful telah disesuaikan dengan harga pasar kuartal terbaru.',
                '10 Menit Lalu',
                const Color(0xff22c55e),
              ),
              const SizedBox(height: 16),
              _buildCyberNotificationItem(
                'LEGALITAS SIUJK AMAN',
                'Surat Izin Usaha Jasa Konstruksi CV DHELATA GRUP terverifikasi aktif 100% pada sistem Stateless.',
                '1 Hari Lalu',
                const Color(0xff3b82f6),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCyberNotificationItem(String title, String desc, String time, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.01),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: themeColor, shape: BoxShape.circle, boxShadow: [BoxShadow(color: themeColor, blurRadius: 6)]),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: themeColor, letterSpacing: 0.5)),
                    Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(desc, style: const TextStyle(fontSize: 12, color: Color(0xff94a3b8), height: 1.4)),
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d16),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xff0f172a),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Center(
                  child: Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.grid_view_rounded, color: Colors.cyan, size: 24),
                        onPressed: () => _openAdvancedNotificationCenter(context),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff0f172a), Color(0xff1e1e38)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      right: -20,
                      child: CircleAvatar(radius: 100, backgroundColor: Colors.cyan.withOpacity(0.04)),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 35),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xff090d16),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.cyan.withOpacity(0.3), width: 1.5),
                              boxShadow: [
                                BoxShadow(color: Colors.cyan.withOpacity(0.15), blurRadius: 20)
                              ],
                            ),
                            child: const Icon(Icons.rocket_launch_rounded, color: Colors.cyan, size: 36),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'CV DHELATA GRUP',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1.5),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.08), 
                              borderRadius: BorderRadius.circular(100), 
                              border: Border.all(color: Colors.cyan.withOpacity(0.3)),
                            ),
                            child: const Text(
                              'ANTARMUKA SISTEM UTAMA v2.0',
                              style: TextStyle(color: Colors.cyan, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.01),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTelemetryStat('SISTEM', 'AKTIF', Colors.green),
                    _buildTelemetryStat('KONEKSI', 'AMAN', Colors.cyan),
                    _buildTelemetryStat('MESIN PO', 'SIAP', Colors.amber),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24, top: 20, bottom: 12),
              child: Text(
                'MATRIKS KONTROL NAVIGASI', 
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 2.0),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildAdvancedCyberCard(context, 'Format Layout Column', 'Katalog Jasa & Portofolio Konstruksi', Icons.view_stream_rounded, const Color(0xffef4444)),
                const SizedBox(height: 12),
                _buildAdvancedCyberCard(context, 'Format Layout Row', 'Metrik Statistik Pencapaian Operasional', Icons.analytics_rounded, const Color(0xff3b82f6)),
                const SizedBox(height: 12),
                _buildAdvancedCyberCard(context, 'Format Halaman Stateless', 'Profil Hukum & Dokumen Legalitas Bisnis', Icons.fingerprint_rounded, const Color(0xffa855f7)),
                const SizedBox(height: 12),
                _buildAdvancedCyberCard(context, 'Format Halaman Stateful', 'Kalkulator Simulasi Estimasi Biaya PO', Icons.hourglass_empty_rounded, const Color(0xff22c55e)),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTelemetryStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color, blurRadius: 4)])),
            const SizedBox(width: 6),
            Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color, letterSpacing: 0.5)),
          ],
        )
      ],
    );
  }

  Widget _buildAdvancedCyberCard(BuildContext context, String title, String sub, IconData icon, Color neonColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.01),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: neonColor.withOpacity(0.15)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Widget targetPage = const ColumnPage();
            if (title.contains('Row')) targetPage = const RowPage();
            if (title.contains('Stateless')) targetPage = const MyStatelessPage();
            if (title.contains('Stateful')) targetPage = const MyStatefulPage();

            Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: neonColor.withOpacity(0.08), 
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: neonColor.withOpacity(0.2))
                  ),
                  child: Icon(icon, color: neonColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                      const SizedBox(height: 4),
                      Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.3)),
                    ],
                  ),
                ),
                Icon(Icons.terminal_rounded, color: neonColor.withOpacity(0.4), size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
