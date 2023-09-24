import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/usecase/location_current.dart';
import 'package:deshifarmer/data/datasources/remote/apis/attendance_api.dart';
import 'package:deshifarmer/domain/entities/attendance/todays_resp_entity.dart';
import 'package:equatable/equatable.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(const AttendanceInitial()) {
    on<CustomAttendanceEvent>(_onCustomAttendanceEvent);
    on<CheckInEvent>(_onCheckInEvent);
    on<CheckOutEvent>(_onCheckOutEvent);
    on<CheckInFromFuture>(_onCheckInFromFuture);
  }

  AttendanceAPI deshiFarmerAPI = AttendanceAPI();

  FutureOr<void> _onCustomAttendanceEvent(
    CustomAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) {}

  /// PERF: checkout
  FutureOr<void> _onCheckOutEvent(CheckOutEvent event, emit) async {
    emit(AttendanceLoading());

    final todaysAtten = await deshiFarmerAPI.checkOut(
      event.token,
      event.id,
      event.msg,
      event.imageFile,
      event.lat,
      event.long,
    );
    if (todaysAtten.$1) {
      emit(AttendanceOut());

      emit(const AttendanceInitial());
    } else {
      emit(const AttendanceError());
      emit(const AttendanceInitial());
    }
  }

  /// PERF: Check in
  FutureOr<void> _onCheckInEvent(CheckInEvent event, emit) async {
    emit(AttendanceLoading());

    ///! TODO: uncomment this
    final todaysAtten = await deshiFarmerAPI.getTodaysAttendance(event.token);

    if (todaysAtten != null) {
      // print('BLOCK att is not NULL');
      emit(AttendanceSuccess(todays: todaysAtten));
    } else {
      // print('else is running');
      try {
        // print('trying get the location');
        final getCurrentPosition = await determinePosition();

        final checkingIN = await deshiFarmerAPI.checkInAPI(
          event.token,
          null,
          event.imageFile,
          getCurrentPosition.latitude,
          getCurrentPosition.longitude,
        );

        // print('check in from BLOCK -> ${checkingIN.$1} : ${checkingIN.$2}');
        if (checkingIN.$1) {
          final todaysAtten =
              await deshiFarmerAPI.getTodaysAttendance(event.token);
          print('todays attendance From BLOC $todaysAtten');
          if (todaysAtten != null) {
            emit(AttendanceSuccess(todays: todaysAtten));
          }
        }
      } catch (e) {
        print('error happend on getting location $e');
        emit(AttendanceError(msg: e.toString()));
      }
      // print('')

      emit(const AttendanceInitial());
    }
  }

  FutureOr<void> _onCheckInFromFuture(CheckInFromFuture event, emit) {
    print('check in FROm FUTURE From BLOC ${event.today}');
    emit(AttendanceSuccess(todays: event.today));
  }
}
