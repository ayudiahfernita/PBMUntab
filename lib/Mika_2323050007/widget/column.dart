import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widget Column")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 100, height: 100, color: Colors.orange),
          SizedBox(height: 20),
          Container(width: 100, height: 100, color: Colors.purple),
          SizedBox(height: 20),
          Container(width: 100, height: 100, color: Colors.teal),
        ],
      ),
    );
  }
}
