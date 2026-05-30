import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateless Page")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.lightBlue,
          child: const Text(
            "Halaman Stateless",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
