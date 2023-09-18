part of 'attendance_bloc.dart';

/// {@template attendance_state}
/// AttendanceState description
/// {@endtemplate}
class AttendanceState extends Equatable {
  /// {@macro attendance_state}
  const AttendanceState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AttendanceState with property changes
  AttendanceState copyWith({
    String? customProperty,
  }) {
    return AttendanceState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template attendance_initial}
/// The initial state of AttendanceState
/// {@endtemplate}
class AttendanceInitial extends AttendanceState {
  /// {@macro attendance_initial}
  const AttendanceInitial() : super();
}

class AttendanceLoading extends AttendanceState {}

class AttendanceError extends AttendanceState {
  const AttendanceError({this.msg});
  final String? msg;
}

///! HACK: check out state
class AttendanceOut extends AttendanceState {}

class AttendanceSuccess extends AttendanceState {
  const AttendanceSuccess({
    required this.todays,
  });
  final TodaysAttendance todays;

  @override
  List<Object> get props => [todays];
}
