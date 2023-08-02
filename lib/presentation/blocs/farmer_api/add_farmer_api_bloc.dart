import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:equatable/equatable.dart';

part 'add_farmer_api_event.dart';
part 'add_farmer_api_state.dart';

class AddFarmerApiBloc extends Bloc<AddFarmerApiEvent, AddFarmerApiState> {
  AddFarmerApiBloc() : super(AddFarmerApiInitial()) {
    on<AddFarmerApiEvent>((event, emit) {});
    on<AddFarmerBtnPressEvent>(_onAddFarmerEvent);
  }

  DeshiFarmerAPI _deshiFarmerAPI = DeshiFarmerAPI();
  FutureOr<void> _onAddFarmerEvent(AddFarmerBtnPressEvent event, emit) async {
    emit(AddFarmerAPILoadingState());
    var farmerAddingResp =
        await _deshiFarmerAPI.addFarmer(event.farmerModel, event.token);

    final value = switch (farmerAddingResp) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };

    if (value is bool) {
      if (value) {
        emit(AddFarmerAPISuccess());
      } else {
        emit(AddFarmerAPIErrorState());
      }
    } else {
      emit(AddFarmerAPIErrorState());
    }
  }
}
