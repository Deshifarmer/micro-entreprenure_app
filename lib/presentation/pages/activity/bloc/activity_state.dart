part of 'activity_bloc.dart';

/// {@template activity_state}
/// ActivityState description
/// {@endtemplate}
class ActivityState extends Equatable {
  /// {@macro activity_state}
  const ActivityState({
    this.customProperty = '',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ActivityState with property changes
  ActivityState copyWith({
    String? customProperty,
  }) {
    return ActivityState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// The initial state of ActivityState
class ActivityInitial extends ActivityState {}

class ActivityFarmerAddState extends ActivityState {
  const ActivityFarmerAddState(this.farmerEntity);
  final FarmerEntity farmerEntity;
}

class ActivityLoadingState extends ActivityState {}
