import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  Future<void> bukaWebsite(
    BuildContext context,
    String url,
    String nama,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Membuka website $nama..."),
        duration: const Duration(seconds: 2),
      ),
    );

    final Uri website = Uri.parse(url);

    await launchUrl(website);
  }

  Widget buildCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    String url,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          bukaWebsite(context, url, title);
        },

        child: Container(
          height: 130,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),

            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(icon, color: Colors.white, size: 40),

              const SizedBox(height: 10),

              Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Materi Row"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Tools Pemrograman",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Klik salah satu card untuk membuka website resminya.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                buildCard(
                  context,
                  Icons.flutter_dash,
                  "Flutter",
                  Colors.blue,
                  "https://flutter.dev",
                ),

                const SizedBox(width: 15),

                buildCard(
                  context,
                  Icons.android,
                  "Android Studio",
                  Colors.green,
                  "https://developer.android.com/studio",
                ),

                const SizedBox(width: 15),

                buildCard(
                  context,
                  Icons.code,
                  "Java",
                  Colors.orange,
                  "https://www.java.com",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
