// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'coffee_bloc.dart';

class CoffeeState extends Equatable {
  final Coffee coffee;
  final String message;

  const CoffeeState({
    required this.coffee,
    this.message = '',
  });

  factory CoffeeState.initial() {
    return const CoffeeState(coffee: Coffee());
  }

  @override
  List<Object> get props => [coffee, message];

  @override
  bool get stringify => true;

  CoffeeState copyWith({
    Coffee? coffee,
    String? message,
  }) {
    return CoffeeState(
      coffee: coffee ?? this.coffee,
      message: message ?? this.message,
    );
  }
}
