import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/coffee.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeState.initial()) {
    on<CoffeeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
