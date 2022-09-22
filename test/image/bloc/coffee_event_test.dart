import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/coffee/coffee_bloc.dart';

import 'coffee_bloc_test.dart';

void main() {
  group('CoffeeEvent', () {
    group('CoffeeLoaded', () {
      test('suppoerts value equality', () {
        final coffee = MockCoffee();
        final instanceA = CoffeeLoadedEvent(coffee: coffee);
        final instanceB = CoffeeLoadedEvent(coffee: coffee);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeLoadError', () {
      test('suppoerts value equality', () {
        const message = 'TEST';
        const instanceA = CoffeeLoadErrorEvent(message: message);
        const instanceB = CoffeeLoadErrorEvent(message: message);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeSaved', () {
      test('suppoerts value equality', () {
        final coffee = MockCoffee();
        final instanceA = CoffeeLoadedEvent(coffee: coffee);
        final instanceB = CoffeeLoadedEvent(coffee: coffee);
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
