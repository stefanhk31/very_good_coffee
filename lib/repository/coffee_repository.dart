import 'package:very_good_coffee/api/coffee_service.dart';

import '../model/coffee.dart';

class CoffeeRepository {
  final provider = CoffeeApiProvider();

  Future<Coffee> getCoffee() => provider.getCoffee();
}
