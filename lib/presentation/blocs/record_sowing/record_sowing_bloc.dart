import 'package:bloc/bloc.dart';
import 'package:deshifarmer/data/datasources/remote/apis/harvest_api.dart';
import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'record_sowing_event.dart';
part 'record_sowing_state.dart';

class RecordSowingBloc extends Bloc<RecordSowingEvent, RecordSowingState> {
  RecordSowingBloc() : super(RecordSowingInitial()) {
    on<RecordSowingEvent>((event, emit) {});
    on<RecordSowingLoadingStopEvent>((event, emit) {
      emit(RecordSowingInitial());
    });
    on<RecordSowingPostEvent>((RecordSowingPostEvent event, emit) async {
      emit(RecordSowingLoading());
      // final getCurrentPosition = await determinePosition();
      final result = await deshiFarmerAPI.recordActivity(
          // getCurrentPosition.latitude.toString(),
          event.ram,
          // getCurrentPosition.longitude.toString(),
          );
      if (result != null) {
        if (result) {
          emit(RecordSowingSuccess());
          emit(RecordSowingInitial());
        } else {
          emit(RecordSowingFailed());
          emit(RecordSowingInitial());
        }
      } else {
        emit(RecordSowingFailed());
        emit(RecordSowingInitial());
      }
    });
  }
  HarvestAPI deshiFarmerAPI = HarvestAPI();
}
