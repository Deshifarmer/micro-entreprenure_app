import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'kpi_event.dart';
part 'kpi_state.dart';

class KpiBloc extends Bloc<KpiEvent, KpiState> {
  KpiBloc() : super(const KpiInitial()) {
    on<CustomKpiEvent>(_onCustomKpiEvent);
  }

  FutureOr<void> _onCustomKpiEvent(
    CustomKpiEvent event,
    Emitter<KpiState> emit,
  ) {
    // TODO: Add Logic
  }
}
