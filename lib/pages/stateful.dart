import 'package:flutter/material.dart';

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<MyStateful> createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  int counter = 0;

  void tambah() {
    setState(() {
      counter++;
    });
  }

  void kurang() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: tambah,
              child: const Text('Tambah'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: kurang,
              child: const Text('Kurang'),
            ),
          ],
        ),
      ),
    );
  }
}