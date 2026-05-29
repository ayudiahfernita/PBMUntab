import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fb),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      Text(
                        "Halo, Terima kasih Sudah membuka Tugas saya 👋",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Selamat Datang Kembali",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,

                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // CARD UTAMA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),

                  gradient: const LinearGradient(
                    colors: [Color(0xff4facfe), Color(0xff00f2fe)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Icon(Icons.school, color: Colors.white, size: 45),

                    SizedBox(height: 20),

                    Text(
                      "Pemrograman Mobile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Tugas Navigation Flutter",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // TITLE
              const Text(
                "Statistik Akademik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // GRID STATISTIK
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,

                  children: [
                    buildStatCard(
                      title: "Absensi",
                      value: "95%",
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),

                    buildStatCard(
                      title: "IPK",
                      value: "3.90",
                      icon: Icons.school,
                      color: Colors.orange,
                    ),

                    buildStatCard(
                      title: "Semester",
                      value: "4",
                      icon: Icons.menu_book,
                      color: Colors.purple,
                    ),

                    buildStatCard(
                      title: "SKS",
                      value: "24",
                      icon: Icons.book,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withOpacity(0.1),

            child: Icon(icon, color: color, size: 30),
          ),

          const SizedBox(height: 15),

          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}
