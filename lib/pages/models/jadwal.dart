class Jadwal {
  final int id;
  final String mataKuliah;
  final String dosen;
  final String semester;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final String ruangan;

  Jadwal({
    required this.id,
    required this.mataKuliah,
    required this.dosen,
    required this.semester,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.ruangan,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      id: json["id"],
      mataKuliah: json["mata_kuliah"]["nama"],
      dosen: json["dosen"]["nama"],
      semester: json["semester"]["nama"],
      hari: json["hari"],
      jamMulai: json["jam_mulai"],
      jamSelesai: json["jam_selesai"],
      ruangan: json["ruangan"],
    );
  }
}