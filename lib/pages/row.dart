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
            child: const Text('Container 1'),
            height: 200,
          ),
          Container(
            color: Colors.green,
            child: const Text('Container 2'),
            width: 100,
            height: 200,
         ),
          Container(
            color: Colors.blue,
            child: const Text('Container 3'),
            height: 100,
          ),
        ],
      ),
    );
  }
}