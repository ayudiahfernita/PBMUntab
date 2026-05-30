import 'package:flutter/material.dart';

import 'angelo_2323050005/statefulpage.dart';

import 'NUGRAHA_2323050026/row.dart' as nugraha;
import 'Buda_2323050001/dashboard.dart';
import 'MADEILALALITA_2323050013/tugas2/main.dart' as ila;
import 'NUGRAHA_2323050026/Tugas_2/main_navigation.dart';
import 'Mika_2323050007/navigation/navigation.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  late final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
    const AbsensiPage(),
    const NilaiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: currentIndex,

          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.blue,

          unselectedItemColor: Colors.grey,

          selectedFontSize: 14,

          unselectedFontSize: 12,

          elevation: 0,

          backgroundColor: Colors.white,

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_rounded),
              label: "Absensi",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.school_rounded),
              label: "Nilai",
            ),
          ],
        ),
      ),
    );
  }
}
