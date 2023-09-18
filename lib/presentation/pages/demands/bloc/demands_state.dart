part of 'demands_bloc.dart';

/// {@template demands_state}
/// DemandsState description
/// {@endtemplate}
class DemandsState extends Equatable {
  /// {@macro demands_state}
  const DemandsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current DemandsState with property changes
  DemandsState copyWith({
    String? customProperty,
  }) {
    return DemandsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template demands_initial}
/// The initial state of DemandsState
/// {@endtemplate}
class DemandsInitial extends DemandsState {
  /// {@macro demands_initial}
  const DemandsInitial() : super();
}
