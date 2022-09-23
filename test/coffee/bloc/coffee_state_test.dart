import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/coffee/bloc/coffee_bloc.dart';

import 'coffee_bloc_test.dart';

void main() {
  group('CoffeeState', () {
    test('supports value equality', () {
      expect(CoffeeState.initial(), equals(CoffeeState.initial()));
    });

    group('copyWith', () {
      test('updates coffee', () {
        final coffee1 = MockCoffee();
        final coffee2 = MockCoffee();
        expect(CoffeeState(coffee: coffee1).copyWith(coffee: coffee2).coffee,
            equals(coffee2));
      });
    });
  });
}
