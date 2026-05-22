import 'package:flutter/material.dart';

import 'column.dart';
import 'row.dart';
import 'stateful.dart';
import 'stateless.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Profil CV',
      'subtitle': 'Contoh StatelessWidget',
      'icon': Icons.person,
      'color': Color(0xFF0F766E),
      'page': MyStateless(),
    },
    {
      'title': 'Skill Mendatar',
      'subtitle': 'Contoh Row',
      'icon': Icons.view_week,
      'color': Color(0xFF2563EB),
      'page': Rows(),
    },
    {
      'title': 'Riwayat Belajar',
      'subtitle': 'Contoh Column',
      'icon': Icons.timeline,
      'color': Color(0xFF7C3AED),
      'page': Columns(),
    },
    {
      'title': 'Project Interaktif',
      'subtitle': 'Contoh StatefulWidget',
      'icon': Icons.touch_app,
      'color': Color(0xFFEA580C),
      'page': MyStateful(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('CV Flutter NUGRAHA_2323050026'),
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xFF111827), size: 40),
                ),
                SizedBox(height: 18),
                Text(
                  'NUGRAHA_2323050026',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'CV sederhana berbasis Flutter yang berisi materi Row, Column, '
                  'StatelessWidget, StatefulWidget, ListView, dan Navigator.',
                  style: TextStyle(color: Color(0xFFD1D5DB), height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...items.map((item) {
            return _MenuCard(
              title: item['title'],
              subtitle: item['subtitle'],
              icon: item['icon'],
              color: item['color'],
              page: item['page'],
            );
          }),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          foregroundColor: Colors.white,
          child: Icon(icon),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
