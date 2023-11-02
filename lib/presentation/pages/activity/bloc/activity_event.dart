part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_activity_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomActivityEvent extends ActivityEvent {
  /// {@macro custom_activity_event}
  const CustomActivityEvent();
}

class ActivityFarmerAddEvent extends ActivityEvent {
  const ActivityFarmerAddEvent(this.farmerEntity);
  final FarmerEntity farmerEntity;
}
