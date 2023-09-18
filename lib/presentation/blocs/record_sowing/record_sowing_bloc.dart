import 'package:bloc/bloc.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'record_sowing_event.dart';
part 'record_sowing_state.dart';

class RecordSowingBloc extends Bloc<RecordSowingEvent, RecordSowingState> {
  RecordSowingBloc() : super(RecordSowingInitial()) {
    on<RecordSowingEvent>((event, emit) {});
    on<RecordSowingPostEvent>((event, emit) async {
      emit(RecordSowingLoading());
      // final getCurrentPosition = await determinePosition();
      // print(
      //     'lat -> ${getCurrentPosition.latitude} ${getCurrentPosition.longitude}');
      ///! TODO: uncomment this
      // final result = await deshiFarmerAPI.recordActivity(
      //     // getCurrentPosition.latitude.toString(),
      //     event.ram
      //     // getCurrentPosition.longitude.toString(),
      //     );
      // if (result != null) {
      //   emit(RecordSowingSuccess());
      //   emit(RecordSowingInitial());
      // } else {
      //   emit(RecordSowingFailed());
      //   emit(RecordSowingInitial());
      // }
    });
  }
  DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
}
