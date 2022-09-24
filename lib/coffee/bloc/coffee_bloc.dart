import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_coffee/helpers/gallery_helper.dart';
import 'package:very_good_coffee/repository/coffee_repository.dart';

import '../../model/coffee_model.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc(CoffeeRepository repository, GalleryHelper galleryHelper)
      : super(CoffeeState.initial()) {
    on<CoffeeEvent>((event, emit) {
      if (event is CoffeeRequestedEvent) {
        _onRequested(event, emit, repository);
      } else if (event is CoffeeLoadedEvent) {
        _onLoaded(event, emit);
      } else if (event is CoffeeLoadErrorEvent) {
        _onLoadError(event, emit);
      } else if (event is CoffeeSaveRequestedEvent) {
        _onSaveRequested(event, emit, galleryHelper);
      } else if (event is CoffeeSavedEvent) {
        _onSaved(event, emit);
      } else if (event is CoffeeSaveErrorEvent) {
        _onSaveError(event, emit);
      }
    });
  }

  void _onRequested(CoffeeRequestedEvent event, Emitter<CoffeeState> emit,
      CoffeeRepository repository) async {
    try {
      emit(state.copyWith(
        coffee: state.coffee,
        loading: true,
      ));
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
      loading: false,
    ));
  }

  void _onLoadError(
    CoffeeLoadErrorEvent event,
    Emitter<CoffeeState> emit,
  ) {
    emit(state.copyWith(
      coffee: event.coffee,
      message: event.message,
      loading: false,
    ));
  }

  void _onSaveRequested(CoffeeSaveRequestedEvent event,
      Emitter<CoffeeState> emit, GalleryHelper helper) async {
    try {
      emit(state.copyWith(
        coffee: event.coffee,
        loading: true,
      ));
      await helper.saveImage(event.coffee.imageUrl);
      add(
        CoffeeSavedEvent(
          coffee: event.coffee,
          message: 'Saved coffee. Yum!',
        ),
      );
    } on Error {
      add(CoffeeSaveErrorEvent(
        coffee: event.coffee,
        message: 'Failed to save coffee.',
      ));
    }
  }

  void _onSaved(CoffeeSavedEvent event, Emitter<CoffeeState> emit) {
    emit(state.copyWith(
      coffee: event.coffee,
      message: event.message,
      loading: false,
    ));
  }

  void _onSaveError(CoffeeSaveErrorEvent event, Emitter<CoffeeState> emit) {
    emit(state.copyWith(
      coffee: event.coffee,
      message: event.message,
      loading: false,
    ));
  }
}
