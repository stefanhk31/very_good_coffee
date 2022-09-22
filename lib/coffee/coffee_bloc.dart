import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_coffee/api/coffee_service.dart';
import 'package:very_good_coffee/repository/coffee_repository.dart';

import '../model/coffee.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc(CoffeeRepository repository) : super(CoffeeState.initial()) {
    on<CoffeeEvent>((event, emit) {
      if (event is CoffeeRequestedEvent) {
        _onRequested(event, emit, repository);
      }
      if (event is CoffeeLoadedEvent) {
        _onLoaded(event, emit);
      } else if (event is CoffeeLoadErrorEvent) {
        _onError(event, emit);
      }
    });
  }

  void _onRequested(CoffeeRequestedEvent event, Emitter<CoffeeState> emit,
      CoffeeRepository repository) async {
    try {
      var coffee = await repository.getCoffee();
      add(
        CoffeeLoadedEvent(coffee: coffee),
      );
    } on Error {
      add(const CoffeeLoadErrorEvent(
        coffee: Coffee(),
        message: 'Failed to load coffee.',
      ));
    }
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
      coffee: event.coffee,
      message: event.message,
    ));
  }
}
