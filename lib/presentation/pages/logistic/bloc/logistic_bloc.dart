import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'logistic_event.dart';
part 'logistic_state.dart';

class LogisticBloc extends Bloc<LogisticEvent, LogisticState> {
  LogisticBloc() : super(const LogisticInitial()) {
    on<CustomLogisticEvent>(_onCustomLogisticEvent);
  }

  FutureOr<void> _onCustomLogisticEvent(
    CustomLogisticEvent event,
    Emitter<LogisticState> emit,
  ) {
    // TODO: Add Logic
  }
}
