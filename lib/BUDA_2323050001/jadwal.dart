import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  Widget jadwalItem(String hari, String matkul) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(hari),
        subtitle: Text(matkul),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Kuliah'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          jadwalItem('Senin', 'Pemrograman Mobile'),
          jadwalItem('Selasa', 'Basis Data'),
          jadwalItem('Rabu', 'Pemrograman Web'),
        ],
      ),
    );
  }
}