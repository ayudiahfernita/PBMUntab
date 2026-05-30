import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int angka = 0;

  void tambahAngka() {
    setState(() {
      angka++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$angka", style: const TextStyle(fontSize: 40)),
            ElevatedButton(onPressed: tambahAngka, child: const Text("Tambah")),
          ],
        ),
      ),
    );
  }
}
