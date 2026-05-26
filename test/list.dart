void main() {
  List<String> buah = ['Apel', 'Mangga', 'Jeruk'];
  List<dynamic> data = ["a", "b", 1];

  print(buah[0]);

  print(buah.length);
  for (var item in buah) {
    print(item);
  }

  for (var item in data) {
    print(item);
  }
}
