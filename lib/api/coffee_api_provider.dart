// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

import '../model/coffee_model.dart';

class CoffeeApiProvider {
  final String baseUrl;
  CoffeeApiProvider({
    this.baseUrl = 'https://coffee.alexflipnote.dev/random.json',
  });

  Future<Coffee> getCoffee() async {
    var url = Uri.tryParse(baseUrl);
    if (url == null) {
      throw Future.error('invalid url');
    }
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Coffee.fromJson(response.body);
    } else {
      throw Future.error(response.statusCode);
    }
  }
}
