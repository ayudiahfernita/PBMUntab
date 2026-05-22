void main() {
  Map<String, String> user = {
    'nama': 'Ayu',
    'kota': 'Denpasar'
  };

  Map<String, dynamic> user2 = {
    'nama': 'Ayu',
    'umur': 25,
    'kota': 'Denpasar'
  };

  List<Map<String, dynamic>> users = [
    {'nama': 'Ayu', 'umur': 25},
    {'nama': 'Budi', 'umur': 30},
    {'nama': 'Citra', 'umur': 28},
  ];

  print(user);
  print(user2);


  users.forEach((user) {
    print(user['nama']);
  });
}