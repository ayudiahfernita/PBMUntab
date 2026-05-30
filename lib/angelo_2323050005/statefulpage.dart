import 'package:flutter/material.dart';
import 'column.dart';
import 'row.dart';
import 'stateful.dart';
import 'stateless.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(colors: [Colors.blueAccent, Colors.purpleAccent]),
                    ),
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Color(0xFF0F172A),
                      child: Icon(Icons.person, size: 36, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Angelo', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      Text('NIM: 2323050005', style: TextStyle(color: Colors.white54, fontSize: 13)),
                      Text('Sistem Informasi', style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text('Flutter Widget Demo', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Pilih salah satu untuk menjelajah', style: TextStyle(color: Colors.white38, fontSize: 13)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _menuCard(context, 'Stateless', 'Widget tanpa state', Icons.widgets, Colors.blueAccent, const StatelessPage()),
                    _menuCard(context, 'Stateful', 'Widget dengan counter', Icons.touch_app, Colors.purpleAccent, const StatefulPage()),
                    _menuCard(context, 'Row', 'Layout horizontal', Icons.table_rows, Colors.tealAccent, const RowPage()),
                    _menuCard(context, 'Column', 'Layout vertikal', Icons.view_column, Colors.orangeAccent, const ColumnPage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, String subtitle, IconData icon, Color color, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}