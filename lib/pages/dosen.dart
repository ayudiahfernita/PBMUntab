import 'package:flutter/material.dart';

class DosenPage extends StatelessWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "Profile Dosen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green.shade700,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // FOTO / ICON DOSEN
                Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 20),

                // NAMA DOSEN
                const Text(
                  "Luh Ayu Diah Fernita Sari, S.Kom., M.T.",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // NIDN
                

                const SizedBox(height: 10),

                // MATA KULIAH
                Text(
                  "Mata Kuliah: Pemrograman Mobile Lanjutan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 10),

                // EMAIL
                Text(
                  "Email: ayudiahfernita@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 24),

                // BUTTON
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}