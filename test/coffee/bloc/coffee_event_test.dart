import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/coffee/bloc/coffee_bloc.dart';

import 'coffee_bloc_test.dart';

void main() {
  group('CoffeeEvent', () {
    group('CoffeeRequested', () {
      test('supports value equality', () {
        final instanceA = CoffeeRequestedEvent();
        final instanceB = CoffeeRequestedEvent();
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeLoaded', () {
      test('supports value equality', () {
        final coffee = MockCoffee();
        final instanceA = CoffeeLoadedEvent(coffee: coffee);
        final instanceB = CoffeeLoadedEvent(coffee: coffee);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeLoadError', () {
      test('supports value equality', () {
        final coffee = MockCoffee();
        const message = 'TEST';
        final instanceA =
            CoffeeLoadErrorEvent(coffee: coffee, message: message);
        final instanceB =
            CoffeeLoadErrorEvent(coffee: coffee, message: message);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeSaveRequested', () {
      test('supports value equality', () {
        final coffee = MockCoffee();
        final instanceA = CoffeeSaveRequestedEvent(coffee: coffee);
        final instanceB = CoffeeSaveRequestedEvent(coffee: coffee);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeSaved', () {
      test('supports value equality', () {
        final coffee = MockCoffee();
        const message = 'TEST';
        final instanceA = CoffeeSavedEvent(coffee: coffee, message: message);
        final instanceB = CoffeeSavedEvent(coffee: coffee, message: message);
        expect(instanceA, equals(instanceB));
      });
    });

    group('CoffeeSaveError', () {
      test('supports value equality', () {
        final coffee = MockCoffee();
        const message = 'TEST';
        final instanceA =
            CoffeeSaveErrorEvent(coffee: coffee, message: message);
        final instanceB =
            CoffeeSaveErrorEvent(coffee: coffee, message: message);
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
