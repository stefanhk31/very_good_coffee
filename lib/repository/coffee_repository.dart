import 'package:very_good_coffee/api/coffee_api_provider.dart';

import '../model/coffee_model.dart';

class CoffeeRepository {
  final provider = CoffeeApiProvider();

  Future<Coffee> getCoffee() => provider.getCoffee();
}
