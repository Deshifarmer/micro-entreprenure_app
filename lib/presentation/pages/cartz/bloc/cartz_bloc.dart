import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'cartz_event.dart';
part 'cartz_state.dart';

class CartzBloc extends Bloc<CartzEvent, CartzState> {
  CartzBloc() : super(const CartzInitial()) {
    on<CustomCartzEvent>(_onCustomCartzEvent);
  }

  FutureOr<void> _onCustomCartzEvent(
    CustomCartzEvent event,
    Emitter<CartzState> emit,
  ) {
    // TODO: Add Logic
  }
}
