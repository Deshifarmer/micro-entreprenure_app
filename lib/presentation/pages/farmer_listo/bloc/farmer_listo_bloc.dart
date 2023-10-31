import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'farmer_listo_event.dart';
part 'farmer_listo_state.dart';

class FarmerListoBloc extends Bloc<FarmerListoEvent, FarmerListoState> {
  FarmerListoBloc() : super(const FarmerListoInitial()) {
    on<CustomFarmerListoEvent>(_onCustomFarmerListoEvent);
  }

  FutureOr<void> _onCustomFarmerListoEvent(
    CustomFarmerListoEvent event,
    Emitter<FarmerListoState> emit,
  ) {
    
  }
}
