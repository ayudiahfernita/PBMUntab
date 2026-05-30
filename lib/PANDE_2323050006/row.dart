import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row Example"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Item 1"),
          SizedBox(width: 10),
          Text("Item 2"),
          SizedBox(width: 10),
          Text("Item 3"),
        ],
      ),
    );
  }
}