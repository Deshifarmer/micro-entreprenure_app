import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'commision_event.dart';
part 'commision_state.dart';

class CommisionBloc extends Bloc<CommisionEvent, CommisionState> {
  CommisionBloc() : super(const CommisionInitial()) {
    on<CustomCommisionEvent>(_onCustomCommisionEvent);
  }

  FutureOr<void> _onCustomCommisionEvent(
    CustomCommisionEvent event,
    Emitter<CommisionState> emit,
  ) {
    
  }
}
