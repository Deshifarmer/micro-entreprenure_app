import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<CustomActivityEvent>(_onCustomActivityEvent);
  }

  FutureOr<void> _onCustomActivityEvent(
    CustomActivityEvent event,
    Emitter<ActivityState> emit,
  ) {}
}
