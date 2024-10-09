part of 'notifications_bloc.dart';

/// {@template notifications_state}
/// NotificationsState description
/// {@endtemplate}
class NotificationsState extends Equatable {
  /// {@macro notifications_state}
  const NotificationsState({
    this.customProperty = 'কোন বিজ্ঞপ্তি পাওয়া যায় না',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current NotificationsState with property changes
  NotificationsState copyWith({
    String? customProperty,
  }) {
    return NotificationsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template notifications_initial}
/// The initial state of NotificationsState
/// {@endtemplate}
class NotificationsInitial extends NotificationsState {
  /// {@macro notifications_initial}
  const NotificationsInitial() : super();
}
