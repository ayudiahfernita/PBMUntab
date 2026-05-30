import 'package:flutter/material.dart';

import 'absensi_page.dart';
import 'homepage.dart';
import 'nilai_page.dart';
import 'profile_page.dart';

/// Shell utama Tugas 2 dengan bottom navigation (4 menu).
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    Homepage(),
    AbsensiPage(),
    NilaiPage(),
    ProfilePage(),
  ];

  static const List<String> _titles = [
    'Beranda',
    'Absensi',
    'Daftar Nilai',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_titles[_currentIndex]} — NUGRAHA'),
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE3EDFA),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            selectedIcon: Icon(Icons.fact_check),
            label: 'Absensi',
          ),
          NavigationDestination(
            icon: Icon(Icons.grade_outlined),
            selectedIcon: Icon(Icons.grade),
            label: 'Nilai',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
