part of 'agri_advisory_bloc.dart';

abstract class AgriAdvisoryEvent extends Equatable {
  const AgriAdvisoryEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_agri_advisory_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAgriAdvisoryEvent extends AgriAdvisoryEvent {
  /// {@macro custom_agri_advisory_event}
  const CustomAgriAdvisoryEvent();
}

class AddAdvisoryEvent extends AgriAdvisoryEvent {
  const AddAdvisoryEvent({
    required this.token,
    required this.members,
    required this.timeslot,
    required this.groupID,
    required this.notes,
    required this.images,
    required this.subject,
  });
  final String token;
  final String subject;
  final String timeslot;
  final String groupID;
  final String notes;

  final List<String> members;
  final List<XFile> images;
}
