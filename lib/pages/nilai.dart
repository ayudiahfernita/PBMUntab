import 'package:flutter/material.dart';

import 'models/nilai.dart';
import 'models/semester.dart';
import 'services/nilai_service.dart';

class NilaiPage extends StatefulWidget {
  const NilaiPage({super.key});

  @override
  State<NilaiPage> createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  final NilaiService service = NilaiService();

  List<Semester> semesters = [];
  List<Nilai> nilais = [];

  Semester? selectedSemester;

  bool loadingSemester = true;
  bool loadingNilai = false;

  double ip = 0;
  int totalSks = 0;

  @override
  void initState() {
    super.initState();
    getSemester();
  }

  Future<void> getSemester() async {
    try {
      semesters = await service.getSemester();

      if (semesters.isNotEmpty) {
        selectedSemester = semesters.first;
        await getNilai(selectedSemester!.id);
      }

      setState(() {
        loadingSemester = false;
      });
    } catch (e) {
      setState(() {
        loadingSemester = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> getNilai(int semesterId) async {
    setState(() {
      loadingNilai = true;
    });

    try {
      final result = await service.getNilai(semesterId);

      setState(() {
        ip = double.parse(result["ip"].toString());
        totalSks = result["total_sks"];
        nilais = result["data"];
        loadingNilai = false;
      });
    } catch (e) {
      setState(() {
        loadingNilai = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Color nilaiColor(String nilai) {
    switch (nilai) {
      case "A":
        return Colors.green;
      case "AB":
        return Colors.lightGreen;
      case "B":
        return Colors.orange;
      case "BC":
        return Colors.deepOrange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Nilai"),
      ),
      body: loadingSemester
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: DropdownButtonFormField<Semester>(
                    value: selectedSemester,
                    decoration: InputDecoration(
                      labelText: "Semester",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: semesters.map((semester) {
                      return DropdownMenuItem(
                        value: semester,
                        child: Text(semester.nama),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      setState(() {
                        selectedSemester = value;
                      });

                      await getNilai(value!.id);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.green.shade600,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "IP Semester",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  ip.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "Total SKS",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "$totalSks",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: loadingNilai
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: nilais.length,
                          itemBuilder: (context, index) {
                            final item = nilais[index];

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              elevation: 3,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      nilaiColor(item.nilaiHuruf),
                                  child: Text(
                                    item.nilaiHuruf,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  item.mataKuliah,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    Text("SKS : ${item.sks}"),
                                    Text(
                                        "Nilai Angka : ${item.nilaiAngka}"),
                                    Text("Bobot : ${item.bobot}"),
                                  ],
                                ),
                                trailing: Text(
                                  item.nilaiHuruf,
                                  style: TextStyle(
                                    color:
                                        nilaiColor(item.nilaiHuruf),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}