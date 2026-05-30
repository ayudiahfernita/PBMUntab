import 'package:flutter/material.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Nilai"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: const [

            Text(
              "Nilai Mahasiswa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text("Nilai UTS : 85"),
            Text("Nilai UAS : 90"),
            Text("Nilai Tugas : 88"),
          ],
        ),
      ),
    );
  }
}