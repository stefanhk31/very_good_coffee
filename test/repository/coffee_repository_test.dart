import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/repository/coffee_repository.dart';

void main() {
  group("CoffeeRepository", () {
    test("can fetch from repository", () async {
      var repository = CoffeeRepository();
      var coffee = await repository.getCoffee();
      expect(coffee, isNotNull);
    });
  });
}
