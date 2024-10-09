part of 'group_detail_bloc.dart';

abstract class GroupDetailEvent extends Equatable {
  const GroupDetailEvent();

  @override
  List<Object> get props => [];
}

class GroupDetailFetchEvent extends GroupDetailEvent {
  /// {@macro custom_group_detail_event}
  const GroupDetailFetchEvent({
    required this.groupID,
    required this.token,
  });
  final String token;
  final String groupID;
}
