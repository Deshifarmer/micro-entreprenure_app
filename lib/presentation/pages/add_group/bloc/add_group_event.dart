part of 'add_group_bloc.dart';

abstract class AddGroupEvent extends Equatable {
  const AddGroupEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_add_group_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAddGroupEvent extends AddGroupEvent {
  const CustomAddGroupEvent({
    required this.leaderID,
    required this.token,
    required this.groupName,
  });
  final String leaderID;
  final String token;
  final String groupName;
}
