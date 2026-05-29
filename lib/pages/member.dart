import 'package:flutter/material.dart';
import 'row.dart';
import 'column.dart';
import '../NUGRAHA_2323050026/statelesspage.dart' as nugraha;
import '../Mika_2323050007/statelesspage.dart' as mika;
import '../Buda_2323050001/dashboard.dart' as buda;
import '../MADEILALALITA_2323050013/main.dart' as ila;
import '../PANDE_2323050006/statelesspage.dart' as pande;

class Member extends StatelessWidget {
  const Member({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Nugraha',
      'subtitle': '21xxxxxxxx',
      'color': Colors.blue,
      'page': nugraha.HomePage(),
    },
    {
      'title': 'Mika',
      'subtitle': '21xxxxxxxx',
      'color': Colors.purple,
      'page': mika.StatelessPage(),
    },
    {
      'title': 'Buda',
      'subtitle': '21xxxxxxxx',
      'color': Colors.orange,
      'page': buda.DashboardPage(),
    },
    {
      'title': 'Madeilalalita',
      'subtitle': '21xxxxxxxx',
      'color': Colors.green,
      'page': const ila.MadeilaApp(),
    },
    {
      'title': 'Pande',
      'subtitle': '21xxxxxxxx',
      'color': Colors.red,
      'page': pande.StatelessPage(),
    },
    
    {
      'title': 'Pande',
      'subtitle': '21xxxxxxxx',
      'color': Colors.red,
      'page': pande.StatelessPage(),
    },
    {
      'title': 'Pande',
      'subtitle': '21xxxxxxxx',
      'color': Colors.red,
      'page': pande.StatelessPage(),
    },
    {
      'title': 'Pande',
      'subtitle': '21xxxxxxxx',
      'color': Colors.red,
      'page': pande.StatelessPage(),
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        title: const Text(
          'Flutter Project',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              'Daftar Anggota',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Pilih halaman yang ingin dibuka',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 4,
                      shadowColor: Colors.black12,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item['page'],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: item['color'].withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: item['color'],
                                  size: 30,
                                ),
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      item['subtitle'],
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}