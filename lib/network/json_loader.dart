import 'package:flutter/services.dart' show rootBundle;

class JSONLoader {
  Future<String> loadJsonData(String fileName) async {
    String jsonString = await rootBundle.loadString('lib/$fileName' '.json');
    return jsonString;
  }
}
