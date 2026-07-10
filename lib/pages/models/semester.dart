class Semester {
  final int id;
  final String nama;
  final int semester;

  Semester({
    required this.id,
    required this.nama,
    required this.semester,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      id: json['id'],
      nama: json['nama'],
      semester: json['semester'],
    );
  }
}