// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/coffee/bloc/coffee_bloc.dart';
import 'package:very_good_coffee/helpers/gallery_helper.dart';
import 'package:very_good_coffee/model/coffee_model.dart';
import 'package:very_good_coffee/repository/coffee_repository.dart';

class MockCoffee extends Mock implements Coffee {}

class MockRepository extends Mock implements CoffeeRepository {}

class MockGalleryHelper extends Mock implements GalleryHelper {}

void main() {
  group('CoffeeBloc', () {
    late Coffee coffee1;
    late Coffee coffee2;
    late CoffeeRepository repository;
    late GalleryHelper galleryHelper;
    late String loadErrorMessage;
    late String saveErrorMessage;
    late String saveSuccessMessage;

    setUp(() {
      coffee1 = MockCoffee();
      coffee2 = MockCoffee();
      repository = MockRepository();
      galleryHelper = MockGalleryHelper();
      loadErrorMessage = 'Failed to load coffee.';
      saveErrorMessage = 'Failed to save coffee.';
      saveSuccessMessage = 'Saved coffee. Yum!';
    });

    test('initial state is CoffeeState', () {
      expect(CoffeeBloc(repository, galleryHelper).state,
          equals(CoffeeState.initial()));
    });

    group("CoffeeRequested", () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is successfully requested',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState.initial(),
        act: (bloc) {
          when(() => repository.getCoffee()).thenAnswer(
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
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState.initial(),
        act: (bloc) {
          when(() => repository.getCoffee()).thenThrow(
            Error(),
          );
          bloc.add(CoffeeRequestedEvent());
        },
        expect: () => [
          CoffeeState(
            coffee: const Coffee(),
            message: loadErrorMessage,
          ),
        ],
      );
    });

    group('CoffeeLoaded', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is loaded',
        build: () => CoffeeBloc(repository, galleryHelper),
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
        build: () => CoffeeBloc(repository, galleryHelper),
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
        'emits updated state with error message when coffee fails to load',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          bloc.add(CoffeeLoadErrorEvent(
            coffee: coffee1,
            message: saveErrorMessage,
          ));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: saveErrorMessage,
          ),
        ],
      );
    });

    group('CoffeeSaveRequested', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee is successfully saved',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          when(() => coffee1.imageUrl).thenReturn('TEST');
          when(() => galleryHelper.saveImage(any())).thenAnswer(
            (_) => Future(() => true),
          );
          bloc.add(CoffeeSaveRequestedEvent(coffee: coffee1));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: saveSuccessMessage,
          ),
        ],
      );

      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state when coffee save request fails',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          when(() => repository.getCoffee()).thenThrow(
            Error(),
          );
          bloc.add(CoffeeSaveRequestedEvent(coffee: coffee1));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: saveErrorMessage,
          ),
        ],
      );
    });

    group('CoffeeSaved', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state with success message when coffee loads',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          when(() => coffee1.imageUrl).thenReturn('TEST');
          when(() => galleryHelper.saveImage(any())).thenAnswer(
            (_) => Future(() => true),
          );

          bloc.add(CoffeeSavedEvent(
            coffee: coffee1,
            message: saveSuccessMessage,
          ));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: saveSuccessMessage,
          ),
        ],
      );
    });

    group('CoffeeSaveError', () {
      blocTest<CoffeeBloc, CoffeeState>(
        'emits updated state with failure message when coffee save request fails',
        build: () => CoffeeBloc(repository, galleryHelper),
        seed: () => CoffeeState(coffee: coffee1),
        act: (bloc) {
          when(() => repository.getCoffee()).thenThrow(
            Error(),
          );
          bloc.add(
              CoffeeSaveErrorEvent(coffee: coffee1, message: loadErrorMessage));
        },
        expect: () => [
          CoffeeState(
            coffee: coffee1,
            message: loadErrorMessage,
          ),
        ],
      );
    });
  });
}
