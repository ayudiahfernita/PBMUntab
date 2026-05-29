import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateless Widget")),
      body: const Center(
        child: Text(
          "Ini adalah Stateless Widget",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
