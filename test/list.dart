void main() {
  List<String> buah = ['Apel', 'Mangga', 'Jeruk'];
  List<dynamic> data = ["a", "b", 1];

  print(buah[0]);

  print(buah.length);
  buah.forEach((item) {
    print(item);
  });

  data.forEach((item) {
    print(item);
  });
}
