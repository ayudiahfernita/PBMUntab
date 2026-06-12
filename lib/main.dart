import 'package:flutter/material.dart';

import 'pages/member.dart';
import 'pages/homepage.dart';
import 'pages/nilai.dart';
import 'pages/dosen.dart';
import 'pages/login_check.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginCheck(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  late final List<Widget> pages = [

    HomePage(
      onMenuTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    ),

    const Member(),

    const NilaiPage(),

    const DosenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed, // 🔥 WAJIB

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Project Mhs",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Nilai",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}