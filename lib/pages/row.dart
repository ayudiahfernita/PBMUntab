import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  const Rows({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Page'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            color: Colors.red,
            height: 200,
            child: const Text('Container 1'),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 200,
            child: const Text('Container 2'),
         ),
          Container(
            color: Colors.blue,
            height: 100,
            child: const Text('Container 3'),
          ),
        ],
      ),
    );
  }
}