import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/api/coffee_service.dart';

void main() {
  group("CoffeeService", () {
    test("can make api call", () async {
      var service = CoffeeService();
      var coffee = await service.getCoffee();
      expect(coffee, isNotNull);
    });
  });
}
