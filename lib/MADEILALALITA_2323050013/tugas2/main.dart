import 'package:flutter/material.dart';

import 'home_page.dart';
import 'absensi_page.dart';
import 'nilai_page.dart';
import 'profile_page.dart';

class MadeilaApp extends StatefulWidget {
  const MadeilaApp({super.key});

  @override
  State<MadeilaApp> createState() => _MadeilaAppState();
}

class _MadeilaAppState extends State<MadeilaApp> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const AbsensiPage(),
    const NilaiPage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,

            type: BottomNavigationBarType.fixed,

            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,

            items: const [

              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                label: 'Absensi',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Nilai',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}