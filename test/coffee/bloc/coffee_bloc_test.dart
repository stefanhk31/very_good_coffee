// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/api/coffee_service.dart';
import 'package:very_good_coffee/coffee/coffee_bloc.dart';
import 'package:very_good_coffee/model/coffee.dart';

class MockCoffee extends Mock implements Coffee {}

class MockCoffeeService extends Mock implements CoffeeService {}

void main() {
  group('CoffeeBloc', () {
    late Coffee coffee1;
    late Coffee coffee2;
    late CoffeeService service;
    late String errorMessage;

    setUp(() {
      coffee1 = MockCoffee();
      coffee2 = MockCoffee();
      service = MockCoffeeService();
      errorMessage = 'Failed to load coffee.';
    });

    test('initial state is CoffeeState', () {
      expect(CoffeeBloc(service).state, equals(CoffeeState.initial()));
    });

    group("CoffeeRequested", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is successfully requested',
        build: () => CoffeeBloc(service),
        seed: () => CoffeeState.initial(),
        act: (bloc) {
          when(() => service.getCoffee()).thenAnswer(
            (_) => Future(() => coffee1),
          );
          bloc.add(CoffeeRequestedEvent());
        },
        expect: () => [
          CoffeeState(coffee: coffee1),
        ],
      );

      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee request fails',
        build: () => CoffeeBloc(service),
        seed: () => CoffeeState.initial(),
        act: (bloc) {
          when(() => service.getCoffee()).thenThrow(
            Error(),
          );
          bloc.add(CoffeeRequestedEvent());
        },
        expect: () => [
          CoffeeState(
            coffee: const Coffee(),
            message: errorMessage,
          ),
        ],
      );
    });

    group('CoffeeLoaded', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is loaded',
        build: () => CoffeeBloc(service),
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
        build: () => CoffeeBloc(service),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) => bloc.add(CoffeeLoadedEvent(
          coffee: coffee2,
        )),
        expect: () => [
          CoffeeState(coffee: coffee2),
        ],
      );
    });

    group('CoffeeLoadError', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee fails to load',
        build: () => CoffeeBloc(service),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          bloc.add(CoffeeLoadErrorEvent(
            coffee: coffee1,
            message: errorMessage,
          ));
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
