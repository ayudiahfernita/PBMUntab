import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;

  void tambahCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful Widget"),
      ),
      body: Center(
        child: Text(
          "Counter: $counter",
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}