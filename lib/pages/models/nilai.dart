class Nilai {
  final int id;
  final double nilaiAngka;
  final String nilaiHuruf;
  final double bobot;

  final String mataKuliah;
  final int sks;

  Nilai({
    required this.id,
    required this.nilaiAngka,
    required this.nilaiHuruf,
    required this.bobot,
    required this.mataKuliah,
    required this.sks,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      id: json['id'],
      nilaiAngka: double.parse(json['nilai_angka'].toString()),
      nilaiHuruf: json['nilai_huruf'],
      bobot: double.parse(json['bobot'].toString()),
      mataKuliah: json['mata_kuliah']['nama'],
      sks: json['mata_kuliah']['sks'],
    );
  }
}