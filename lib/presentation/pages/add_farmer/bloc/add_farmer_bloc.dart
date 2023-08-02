import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'add_farmer_event.dart';
part 'add_farmer_state.dart';

class AddFarmerBloc extends Bloc<AddFarmerEvent, AddFarmerState> {
  AddFarmerBloc() : super(AddFarmerInitial()) {
    on<CustomAddFarmerEvent>(_onCustomAddFarmerEvent);
  }

  FutureOr<void> _onCustomAddFarmerEvent(
    CustomAddFarmerEvent event,
    Emitter<AddFarmerState> emit,
  ) {
    // TODO: Add Logic
  }
}
