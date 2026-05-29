import 'package:flutter/material.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      appBar: AppBar(
        title: const Text(
          "Data Nilai",

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),

        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          buildNilai("Pemrograman Mobile", "A"),

          buildNilai("Basis Data", "A"),

          buildNilai("Jaringan Komputer", "B+"),

          buildNilai("Kecerdasan Buatan", "A"),
        ],
      ),
    );
  }

  Widget buildNilai(String matkul, String nilai) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(
        leading: const Icon(Icons.school, color: Colors.orange),

        title: Text(matkul),

        trailing: Text(
          nilai,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
