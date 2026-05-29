import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      appBar: AppBar(
        title: const Text(
          "Profile Mahasiswa",

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),

        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,

                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 20),

              const Text(
                "Mika",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "2323050007",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const Divider(height: 40),

              buildInfo(Icons.email, "mika@gmail.com"),
              buildInfo(Icons.phone, "08123456789"),
              buildInfo(Icons.school, "Universitas TAB"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
    );
  }
}
