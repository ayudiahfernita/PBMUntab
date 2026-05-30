import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() { if (_counter > 0) _counter--; });
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Stateful Widget', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text('Angelo', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('2323050005', style: TextStyle(color: Colors.purpleAccent, fontSize: 13)),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
              ),
              child: Column(
                children: [
                  const Text('Counter', style: TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(
                    '$_counter',
                    style: const TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _actionBtn(Icons.remove, Colors.redAccent, _decrement),
                      const SizedBox(width: 16),
                      _actionBtn(Icons.refresh, Colors.orangeAccent, _reset),
                      const SizedBox(width: 16),
                      _actionBtn(Icons.add, Colors.greenAccent, _increment),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionBtn(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56, height: 56,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          border: Border.all(color: color.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}