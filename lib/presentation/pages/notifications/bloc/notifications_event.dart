part of 'notifications_bloc.dart';

abstract class NotificationsEvent  extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_notifications_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomNotificationsEvent extends NotificationsEvent {
  /// {@macro custom_notifications_event}
  const CustomNotificationsEvent();
}
