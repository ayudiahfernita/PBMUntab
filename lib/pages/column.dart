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
            width: 100,
            height: 100,
            child: const Text('Container 1'),
          ),
          Container(
            color: Colors.green,
            width: 200,
            height: 100,
            child: const Text('Container 2'),
          ),
          Container(
            color: Colors.blue,
            width: 300,
            height: 100,
            child: const Text('Container 3'),
          ),
        ],
      ),
    );
  }
}