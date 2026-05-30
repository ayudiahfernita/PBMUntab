import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final Function(int) onMenuTap;
  const HomePage({super.key, required this.onMenuTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        title: const Text(
          "Universitas Tabanan",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Selamat Datang 👋",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Portal Akademik UNTAB",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // MENU GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,

                // JANGAN PAKAI CONST
                children: [

                  MenuCard(
                    title: "Project Mhs",
                    icon: Icons.business,
                    color: Colors.blue,
                    onTap: () {
                      onMenuTap(1);
                    },
                  ),

                  MenuCard(
                    title: "Nilai",
                    icon: Icons.school,
                    color: Colors.orange,
                    onTap: () {
                      onMenuTap(2);
                    },
                  ),

                  MenuCard(
                    title: "Dosen",
                    icon: Icons.person,
                    color: Colors.purple,
                    onTap: () {
                      onMenuTap(3);
                    },
                  ),

                  MenuCard(
                    title: "Pengumuman",
                    icon: Icons.campaign,
                    color: Colors.red,
                    onTap: () {
                      print("Menu Pengumuman");
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // INFO CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [

                    Icon(
                      Icons.info,
                      color: Colors.green.shade700,
                      size: 40,
                    ),

                    const SizedBox(width: 16),

                    const Expanded(
                      child: Text(
                        "Selamat datang di aplikasi Universitas Tabanan.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  // TAMBAHAN onTap
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        // PAKAI onTap DARI PARAMETER
        onTap: onTap,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CONTOH HALAMAN MEMBER
