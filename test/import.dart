import 'dart:math';
import 'dart:convert';

void main() {
  print(pi);        // 3.1415...
  print(Random().nextInt(10));


  String jsonString = '{"nama": "Ayu"}';

  var data = jsonDecode(jsonString);
  print(data['nama']);
  
}
