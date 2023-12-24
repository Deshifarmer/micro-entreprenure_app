import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'harvest_event.dart';
part 'harvest_state.dart';

class HarvestBloc extends Bloc<HarvestEvent, HarvestState> {
  HarvestBloc() : super(const HarvestInitial()) {
    on<CustomHarvestEvent>(_onCustomHarvestEvent);
  }

  FutureOr<void> _onCustomHarvestEvent(
    CustomHarvestEvent event,
    Emitter<HarvestState> emit,
  ) {
    
  }
}
