part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_attendance_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAttendanceEvent extends AttendanceEvent {
  /// {@macro custom_attendance_event}
  const CustomAttendanceEvent();
}

class CheckInEvent extends AttendanceEvent {
  const CheckInEvent({
    required this.token,
    required this.imageFile,
  });
  final String token;

  final String imageFile;
}

class CheckOutEvent extends AttendanceEvent {
  const CheckOutEvent({
    required this.token,
    required this.id,
    required this.imageFile,
    required this.lat,
    required this.long,
    this.msg,
  });
  final String imageFile;
  final String token;
  final String id;
  final String? msg;
  final double lat;
  final double long;
}

/// FIX:check in success from futurebuilder
class CheckInFromFuture extends AttendanceEvent {
  const CheckInFromFuture(this.today);

  final TodaysAttendance today;
}
