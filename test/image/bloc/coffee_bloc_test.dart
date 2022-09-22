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
    late String errorMessage;

    setUp(() {
      coffee1 = MockCoffee();
      coffee2 = MockCoffee();
      errorMessage = 'TEST ERROR MESSAGE';
    });

    test('initial state is CoffeeState', () {
      expect(CoffeeBloc().state, equals(CoffeeState.initial()));
    });

    group("CoffeeLoaded", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is first loaded',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState.initial(),
        act: (bloc) => bloc.add(CoffeeLoadedEvent(
          coffee: coffee1,
        )),
        expect: () => [
          CoffeeState(coffee: coffee1),
        ],
      );

      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when new coffee is loaded',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) => bloc.add(CoffeeLoadedEvent(
          coffee: coffee2,
        )),
        expect: () => [
          CoffeeState(coffee: coffee2),
        ],
      );
    });

    group("CoffeeLoadError", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee fails to load',
        build: () => CoffeeBloc(),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          bloc.add(CoffeeLoadErrorEvent(message: errorMessage));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: errorMessage,
          ),
        ],
      );
    });
  });
}
