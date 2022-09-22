// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/coffee/coffee_bloc.dart';
import 'package:very_good_coffee/model/coffee.dart';

class MockCoffee extends Mock implements Coffee {}

void main() {
  group("CoffeeBloc", () {
    late Coffee coffee1;
    late Coffee coffee2;

    setUp(() {
      coffee1 = MockCoffee();
      coffee2 = MockCoffee();
    });

    test('initial state is CoffeeState', () {
      expect(CoffeeBloc().state, equals(CoffeeState.initial()));
    });

    group("CoffeeLoaded", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when image is loaded',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState.initial(),
        act: (bloc) => bloc.add(CoffeeLoadedEvent(
          coffee: coffee1,
        )),
        expect: () => [
          CoffeeState(coffee: coffee1),
        ],
      );
    });

    group("CoffeeLoadError", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'state does not change when image fails to load',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) => bloc.add(CoffeeLoadErrorEvent(message: 'TEST')),
        expect: () => [
          CoffeeState(
            coffee: coffee1,
          ),
        ],
      );
    });

    group("CoffeeSaved", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when image is saved',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) => bloc.add(CoffeeSavedEvent(
          coffee: coffee1,
        )),
        expect: () => [
          CoffeeState(
            coffee: coffee2,
          )
        ],
      );
    });
  });
}
