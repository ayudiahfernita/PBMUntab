import 'package:flutter/material.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  Widget skillItem(String text, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),

          const SizedBox(height: 15),

          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Pemrograman'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,

          children: [
            skillItem(
              'Flutter',
              Icons.phone_android,
              Colors.blue,
            ),

            skillItem(
              'PHP',
              Icons.web,
              Colors.orange,
            ),

            skillItem(
              'HTML',
              Icons.code,
              Colors.red,
            ),

            skillItem(
              'MySQL',
              Icons.storage,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}