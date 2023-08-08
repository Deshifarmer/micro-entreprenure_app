part of 'farmer_listo_bloc.dart';

/// {@template farmer_listo_state}
/// FarmerListoState description
/// {@endtemplate}
class FarmerListoState extends Equatable {
  /// {@macro farmer_listo_state}
  const FarmerListoState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current FarmerListoState with property changes
  FarmerListoState copyWith({
    String? customProperty,
  }) {
    return FarmerListoState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template farmer_listo_initial}
/// The initial state of FarmerListoState
/// {@endtemplate}
class FarmerListoInitial extends FarmerListoState {
  /// {@macro farmer_listo_initial}
  const FarmerListoInitial() : super();
}
