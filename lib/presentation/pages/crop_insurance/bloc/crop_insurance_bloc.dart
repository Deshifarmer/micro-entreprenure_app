import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
part 'crop_insurance_event.dart';
part 'crop_insurance_state.dart';

class CropInsuranceBloc extends Bloc<CropInsuranceEvent, CropInsuranceState> {
  CropInsuranceBloc() : super(CropInsuranceInitial()) {
    on<CustomCropInsuranceEvent>(_onCustomCropInsuranceEvent);
  }

  FutureOr<void> _onCustomCropInsuranceEvent(
    CustomCropInsuranceEvent event,
    Emitter<CropInsuranceState> emit,
  ) {}
}
