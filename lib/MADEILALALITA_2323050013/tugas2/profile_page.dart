import 'package:flutter/material.dart';
import 'detail_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Profile Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF7B61FF),
                        Color(0xFFA88BFF),
                      ],
                    ),
                  ),

                  child: const Column(
                    children: [

                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,

                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.deepPurple,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        'Made Ila Lalita',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        '2323050013',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                infoCard(
                  context,
                  Icons.school,
                  'Program Studi',
                  'Teknik Komputer',
                ),

                infoCard(
                  context,
                  Icons.email,
                  'Email',
                  'madeilalalita@gmail.com',
                ),

                infoCard(
                  context,
                  Icons.phone,
                  'Telepon',
                  '081234567890',
                ),

                infoCard(
                  context,
                  Icons.location_on,
                  'Alamat',
                  'Bali, Indonesia',
                ),

                infoCard(
                  context,
                  Icons.calendar_month,
                  'Semester',
                  'Semester 4',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {

    return InkWell(

      borderRadius: BorderRadius.circular(24),

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) => DetailPage(
              title: title,
              subtitle: subtitle,
              icon: icon,
              color: Colors.deepPurple,
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: ListTile(
          contentPadding: const EdgeInsets.all(18),

          leading: Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color:
                  Colors.deepPurple.withValues(alpha: 0.15),

              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: Colors.deepPurple,
            ),
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),

            child: Text(subtitle),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ),
      ),
    );
  }
}