// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'coffee_bloc.dart';

class CoffeeState extends Equatable {
  final Coffee coffee;
  const CoffeeState({
    required this.coffee,
  });

  factory CoffeeState.initial() {
    return const CoffeeState(coffee: Coffee());
  }

  @override
  List<Object> get props => [coffee];

  @override
  bool get stringify => true;

  CoffeeState copyWith({
    Coffee? coffee,
  }) {
    return CoffeeState(
      coffee: coffee ?? this.coffee,
    );
  }
}
