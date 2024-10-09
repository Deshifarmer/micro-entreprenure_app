import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'farmer_profile_event.dart';
part 'farmer_profile_state.dart';

class FarmerProfileBloc extends Bloc<FarmerProfileEvent, FarmerProfileState> {
  FarmerProfileBloc() : super(const FarmerProfileInitial()) {
    on<CustomFarmerProfileEvent>(_onCustomFarmerProfileEvent);
  }

  FutureOr<void> _onCustomFarmerProfileEvent(
    CustomFarmerProfileEvent event,
    Emitter<FarmerProfileState> emit,
  ) {
    // TODO: Add Logic
  }
}
