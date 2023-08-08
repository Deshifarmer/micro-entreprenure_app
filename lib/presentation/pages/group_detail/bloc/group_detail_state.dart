part of 'group_detail_bloc.dart';

/// {@template group_detail_state}
/// GroupDetailState description
/// {@endtemplate}
class GroupDetailState extends Equatable {
  /// {@macro group_detail_state}
  const GroupDetailState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GroupDetailState with property changes
  GroupDetailState copyWith({
    String? customProperty,
  }) {
    return GroupDetailState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template group_detail_initial}
/// The initial state of GroupDetailState
/// {@endtemplate}
class GroupDetailInitial extends GroupDetailState {
  /// {@macro group_detail_initial}
  const GroupDetailInitial() : super();
}

/// Group detail fetch
class GroupDetailLoading extends GroupDetailState {}

/// group detal fetched successful
class GroupDetailFetchSuccessFull extends GroupDetailState {
  const GroupDetailFetchSuccessFull({
    required this.groupDetailEntity,
  });
  final GroupDetailEntity groupDetailEntity;
}

/// Group detail feteched failed
class GroupDetailFetchFailed extends GroupDetailState {
  const GroupDetailFetchFailed({
    required this.message,
  });
  final String message;
}
