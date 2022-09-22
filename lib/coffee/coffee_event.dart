// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'coffee_bloc.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object> get props => [];
}

class CoffeeRequestedEvent extends CoffeeEvent {}

class CoffeeLoadedEvent extends CoffeeEvent {
  final Coffee coffee;
  const CoffeeLoadedEvent({
    required this.coffee,
  });
}

class CoffeeLoadErrorEvent extends CoffeeEvent {
  final Coffee coffee;
  final String message;
  const CoffeeLoadErrorEvent({
    required this.coffee,
    required this.message,
  });
}
