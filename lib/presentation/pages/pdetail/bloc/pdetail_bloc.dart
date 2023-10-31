import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'pdetail_event.dart';
part 'pdetail_state.dart';

class PdetailBloc extends Bloc<PdetailEvent, PdetailState> {
  PdetailBloc() : super(const PdetailInitial()) {
    on<CustomPdetailEvent>(_onCustomPdetailEvent);
  }

  FutureOr<void> _onCustomPdetailEvent(
    CustomPdetailEvent event,
    Emitter<PdetailState> emit,
  ) {}
}
