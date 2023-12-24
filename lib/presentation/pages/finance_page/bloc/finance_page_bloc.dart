import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'finance_page_event.dart';
part 'finance_page_state.dart';

class FinancePageBloc extends Bloc<FinancePageEvent, FinancePageState> {
  FinancePageBloc() : super(const FinancePageInitial()) {
    on<CustomFinancePageEvent>(_onCustomFinancePageEvent);
  }

  FutureOr<void> _onCustomFinancePageEvent(
    CustomFinancePageEvent event,
    Emitter<FinancePageState> emit,
  ) {
    // TODO: Add Logic
  }
}
