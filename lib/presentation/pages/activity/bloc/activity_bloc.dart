import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:equatable/equatable.dart';
part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<CustomActivityEvent>(_onCustomActivityEvent);
    on<ActivityFarmerAddEvent>(_onFarmerAddingEvent);
  }

  FutureOr<void> _onCustomActivityEvent(
    CustomActivityEvent event,
    Emitter<ActivityState> emit,
  ) {
    emit(ActivityInitial());
  }

  FutureOr<void> _onFarmerAddingEvent(
    ActivityFarmerAddEvent event,
    Emitter<ActivityState> emit,
  ) {
    emit(ActivityLoadingState());
    emit(ActivityFarmerAddState(event.farmerEntity));
  }
}
