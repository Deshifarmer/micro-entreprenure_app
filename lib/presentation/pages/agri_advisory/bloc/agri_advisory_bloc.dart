import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
part 'agri_advisory_event.dart';
part 'agri_advisory_state.dart';

class AgriAdvisoryBloc extends Bloc<AgriAdvisoryEvent, AgriAdvisoryState> {
  AgriAdvisoryBloc() : super(AgriAdvisoryInitial()) {
    on<CustomAgriAdvisoryEvent>(_onCustomAgriAdvisoryEvent);
    on<AddAdvisoryEvent>(_onAdvisoryPostEvent);
  }

  DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
  FutureOr<void> _onCustomAgriAdvisoryEvent(
    CustomAgriAdvisoryEvent event,
    Emitter<AgriAdvisoryState> emit,
  ) {}
  FutureOr<void> _onAdvisoryPostEvent(AddAdvisoryEvent event, emit) async {
    emit(AgriLoading());

    // /! TODO: uncomment this
    // final resp = await deshiFarmerAPI.addAdvisory(
    //   token: event.token,
    //   subject: event.subject,
    //   timeslot: event.timeslot,
    //   groupID: event.groupID,
    //   members: event.members,
    //   notes: event.notes,
    //   images: event.images,
    // );
    // print('this is repost adiv -> ${resp}');
    // if (resp is ServerFailor) {
    //   emit(AgriFailed());
    //   emit(AgriAdvisoryInitial());
    // } else {
    //   emit(AgriSuccessfully());
    //   emit(AgriAdvisoryInitial());
    // }
  }
}
