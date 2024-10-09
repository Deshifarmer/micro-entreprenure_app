import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsInitial()) {
    on<CustomNotificationsEvent>(_onCustomNotificationsEvent);
  }

  FutureOr<void> _onCustomNotificationsEvent(
    CustomNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) {
    // TODO: Add Logic
  }
}
