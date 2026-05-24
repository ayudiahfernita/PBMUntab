import 'package:flutter/material.dart';

import 'profil.dart';
import 'skill.dart';
import 'jadwal.dart';
import 'project.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<Map<String, dynamic>> menus = const [
    {
      'title': 'Profil Mahasiswa',
      'subtitle': 'Data diri mahasiswa',
      'icon': Icons.person,
      'color': Colors.blue,
      'page': ProfilPage(),
    },
    {
      'title': 'Skill Pemrograman',
      'subtitle': 'Kemampuan coding',
      'icon': Icons.code,
      'color': Colors.green,
      'page': SkillPage(),
    },
    {
      'title': 'Jadwal Kuliah',
      'subtitle': 'Jadwal perkuliahan',
      'icon': Icons.school,
      'color': Colors.orange,
      'page': JadwalPage(),
    },
    {
      'title': 'Project Interaktif',
      'subtitle': 'StatefulWidget',
      'icon': Icons.touch_app,
      'color': Colors.purple,
      'page': ProjectPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa UNTAB'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          Container(
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),

              borderRadius: BorderRadius.circular(25),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.school,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'BUDA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  '2323050001',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Aplikasi Flutter Dashboard Mahasiswa modern '
                  'untuk pembelajaran widget dasar Flutter.',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          ...menus.map((menu) {
            return Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(12),

                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: menu['color'],

                  child: Icon(
                    menu['icon'],
                    color: Colors.white,
                  ),
                ),

                title: Text(
                  menu['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(menu['subtitle']),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menu['page'],
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              'Flutter Mobile Programming - UNTAB',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}