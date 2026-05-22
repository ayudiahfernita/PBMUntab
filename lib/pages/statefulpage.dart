import 'package:flutter/material.dart';
import 'row.dart';
import 'column.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Row',
      'page': Rows(),
    },
    {
      'title': 'Column',
      'page': Columns(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(items[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => items[index]['page'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

