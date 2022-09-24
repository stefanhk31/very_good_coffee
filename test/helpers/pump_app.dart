import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/coffee/coffee.dart';

class MockCoffeeBloc extends MockBloc<CoffeeEvent, CoffeeState>
    implements CoffeeBloc {}

class FakeCoffeeEvent extends Fake implements CoffeeEvent {}

class FakeCoffeeState extends Fake implements CoffeeState {}

MaterialApp pumpMaterialApp(Widget child) {
  return MaterialApp(
    home: LoaderOverlay(child: child),
  );
}
