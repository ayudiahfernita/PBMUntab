import 'package:flutter/material.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Nilai'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            buildCard('Nilai UTS', '90'),
            buildCard('Nilai UAS', '95'),
            buildCard('Nilai Tugas', '93'),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String nilai) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),

      child: ListTile(
        leading: const Icon(Icons.school, color: Colors.teal),
        title: Text(title),
        trailing: Text(
          nilai,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}