import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'demands_event.dart';
part 'demands_state.dart';

class DemandsBloc extends Bloc<DemandsEvent, DemandsState> {
  DemandsBloc() : super(const DemandsInitial()) {
    on<CustomDemandsEvent>(_onCustomDemandsEvent);
  }

  FutureOr<void> _onCustomDemandsEvent(
    CustomDemandsEvent event,
    Emitter<DemandsState> emit,
  ) {
    // TODO: Add Logic
  }
}
