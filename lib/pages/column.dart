import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  const Columns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            color: Colors.red,
            child: const Text('Container 1'),
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            child: const Text('Container 2'),
            width: 200,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            child: const Text('Container 3'),
            width: 300,
            height: 100,
          ),
        ],
      ),
    );
  }
}