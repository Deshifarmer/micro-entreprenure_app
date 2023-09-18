part of 'harvest_bloc.dart';

/// {@template harvest_state}
/// HarvestState description
/// {@endtemplate}
class HarvestState extends Equatable {
  /// {@macro harvest_state}
  const HarvestState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current HarvestState with property changes
  HarvestState copyWith({
    String? customProperty,
  }) {
    return HarvestState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template harvest_initial}
/// The initial state of HarvestState
/// {@endtemplate}
class HarvestInitial extends HarvestState {
  /// {@macro harvest_initial}
  const HarvestInitial() : super();
}
