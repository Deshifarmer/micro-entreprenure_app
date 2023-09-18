import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/core/usecase/location_current.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/models/add_farm_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
part 'farmadd_form_event.dart';
part 'farmadd_form_state.dart';

class FarmaddFormBloc extends Bloc<FarmaddFormEvent, FarmaddFormState> {
  FarmaddFormBloc() : super(FarmaddFormInitial()) {
    on<AddFarmFormEvent>(_onCustomFarmaddFormEvent);
  }
  DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
  FutureOr<void> _onCustomFarmaddFormEvent(
    AddFarmFormEvent event,
    Emitter<FarmaddFormState> emit,
  ) async {
    emit(FarmAddLoading());
    final getCurrentPosition = await determinePosition();
    print(
        'lat -> ${getCurrentPosition.latitude} ${getCurrentPosition.longitude}',);
    final result = await deshiFarmerAPI.addFarm(
      event.farmModel,
      event.token,
      getCurrentPosition.latitude.toString(),
      getCurrentPosition.longitude.toString(),
    );
    print('final result -> $result');
    if (result is Success) {
      emit(FarmAddingSuccess());
      emit(FarmaddFormInitial());
    } else {
      emit(FarmAddingFailed());
      emit(FarmaddFormInitial());
    }
  }
}
