import 'package:flutter/material.dart';

import 'absensi_page.dart';
import 'nilai_page.dart';
import 'profile_page.dart';
import 'jadwal_page.dart';
import 'tugas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                /// HEADER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Hello, Made 👋',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Dashboard Akademik',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.all(4),

                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(18),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.05,
                            ),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue,

                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// CARD AKADEMIK
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors: [
                        Color(0xFF4A6CF7),
                        Color(0xFF6EA8FF),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(
                          alpha: 0.25,
                        ),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              const Text(
                                'Mahasiswa Aktif',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'Made Ila Lalita',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                'NIM : 2323050013',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            padding:
                                const EdgeInsets.all(18),

                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withValues(alpha: 0.15),

                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            child: const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          statistikItem(
                            'IPK',
                            '3.85',
                          ),

                          statistikItem(
                            'Semester',
                            '4',
                          ),

                          statistikItem(
                            'SKS',
                            '24',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                /// QUICK MENU
                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                GridView.count(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 1.05,

                  children: [

                    dashboardCard(
                      context,
                      'Absensi',
                      Icons.check_circle,
                      const Color(0xFF22C55E),
                      const AbsensiPage(),
                    ),

                    dashboardCard(
                      context,
                      'Nilai',
                      Icons.school,
                      const Color(0xFFF59E0B),
                      const NilaiPage(),
                    ),

                    dashboardCard(
                      context,
                      'Jadwal',
                      Icons.calendar_month,
                      const Color(0xFFEF4444),
                      const JadwalPage(),
                    ),

                    dashboardCard(
                      context,
                      'Tugas',
                      Icons.assignment,
                      const Color(0xFF14B8A6),
                      const TugasPage(),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                /// RECENT ACTIVITY
                const Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                activityCard(
                  Icons.check_circle,
                  Colors.green,
                  'Absensi Berhasil',
                  'Pemrograman Mobile • Hari ini',
                ),

                activityCard(
                  Icons.assignment,
                  Colors.orange,
                  'Tugas Baru',
                  'UI Flutter • Deadline besok',
                ),

                activityCard(
                  Icons.school,
                  Colors.blue,
                  'Nilai Telah Update',
                  'Basis Data • Grade A',
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget statistikItem(
    String title,
    String value,
  ) {

    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget dashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {

    return InkWell(

      borderRadius: BorderRadius.circular(28),

      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
              ),

              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),

            const Spacer(),

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Tap untuk membuka',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityCard(
    IconData icon,
    Color color,
    String title,
    String subtitle,
  ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}