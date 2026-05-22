import 'package:flutter/material.dart';

class MyStateless extends StatelessWidget {
  const MyStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Page'),
      ),
      body: const Center(
        child: Text('Hello Stateless'),
      ),
    );
  }
}