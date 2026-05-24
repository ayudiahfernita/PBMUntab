import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int nilai = 0;

  void tambah() {
    setState(() {
      nilai++;
    });
  }

  void kurang() {
    setState(() {
      nilai--;
    });
  }

  void reset() {
    setState(() {
      nilai = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Interaktif'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.touch_app,
              size: 80,
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            Text(
              '$nilai',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: tambah,
              child: const Text('Tambah'),
            ),

            ElevatedButton(
              onPressed: kurang,
              child: const Text('Kurang'),
            ),

            ElevatedButton(
              onPressed: reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}