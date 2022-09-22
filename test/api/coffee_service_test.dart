import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/api/coffee_api_provider.dart';

void main() {
  group("CoffeeApiProvider", () {
    test("can make api call", () async {
      var provider = CoffeeApiProvider();
      var coffee = await provider.getCoffee();
      expect(coffee, isNotNull);
    });
  });
}
