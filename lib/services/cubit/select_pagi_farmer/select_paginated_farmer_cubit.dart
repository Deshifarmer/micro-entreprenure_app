import 'package:bloc/bloc.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:equatable/equatable.dart';

part 'select_paginated_farmer_state.dart';

class SelectPaginatedFarmerCubit extends Cubit<SelectPaginatedFarmerState> {
  SelectPaginatedFarmerCubit() : super(SelectPaginatedFarmerInitial());
  // add a method to emit a farmer entity
  void selectFarmer(FarmerEntity farmerEntity) {
    emit(SelectPaginatedFarmerInitial());
    emit(SelectPaginatedFarmer(farmerEntity));
  }

  // goto init state
  void gotoInitState() {
    emit(SelectPaginatedFarmerInitial());
  }
}
