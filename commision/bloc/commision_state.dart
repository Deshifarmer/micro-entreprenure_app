part of 'commision_bloc.dart';

/// {@template commision_state}
/// CommisionState description
/// {@endtemplate}
class CommisionState extends Equatable {
  /// {@macro commision_state}
  const CommisionState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CommisionState with property changes
  CommisionState copyWith({
    String? customProperty,
  }) {
    return CommisionState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template commision_initial}
/// The initial state of CommisionState
/// {@endtemplate}
class CommisionInitial extends CommisionState {
  /// {@macro commision_initial}
  const CommisionInitial() : super();
}
