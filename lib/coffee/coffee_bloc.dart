import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/coffee.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeState.initial()) {
    on<CoffeeEvent>((event, emit) {
      if (event is CoffeeLoadedEvent) {
        _onLoaded(event, emit);
      } else if (event is CoffeeLoadErrorEvent) {
        _onError(event, emit);
      }
    });
  }

  void _onLoaded(
    CoffeeLoadedEvent event,
    Emitter<CoffeeState> emit,
  ) {
    emit(state.copyWith(
      coffee: event.coffee,
    ));
  }

  void _onError(
    CoffeeLoadErrorEvent event,
    Emitter<CoffeeState> emit,
  ) {
    emit(state.copyWith(
      coffee: state.coffee,
      message: event.message,
    ));
  }
}
