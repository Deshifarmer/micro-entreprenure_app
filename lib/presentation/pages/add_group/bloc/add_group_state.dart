part of 'add_group_bloc.dart';

/// {@template add_group_state}
/// AddGroupState description
/// {@endtemplate}
class AddGroupState extends Equatable {
  /// {@macro add_group_state}
  const AddGroupState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddGroupState with property changes
  AddGroupState copyWith({
    String? customProperty,
  }) {
    return AddGroupState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template add_group_initial}
/// The initial state of AddGroupState
/// {@endtemplate}
class AddGroupInitial extends AddGroupState {
  AddGroupInitial({
    this.leaderID,
  }) : super();

  final TextEditingController groupNameController = TextEditingController();
  String? leaderID;

  set setLeaderID(String lid) {
    leaderID = lid;
  }

  @override
  List<Object> get props => [groupNameController, leaderID ?? ''];
}

class GroupCreatedSuccessfully extends AddGroupState {}

class GroupCreatedFailed extends AddGroupState {}
