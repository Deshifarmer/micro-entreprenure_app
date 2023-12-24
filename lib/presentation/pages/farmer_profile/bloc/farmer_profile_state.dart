part of 'farmer_profile_bloc.dart';

/// {@template farmer_profile_state}
/// FarmerProfileState description
/// {@endtemplate}
class FarmerProfileState extends Equatable {
  /// {@macro farmer_profile_state}
  const FarmerProfileState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current FarmerProfileState with property changes
  FarmerProfileState copyWith({
    String? customProperty,
  }) {
    return FarmerProfileState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template farmer_profile_initial}
/// The initial state of FarmerProfileState
/// {@endtemplate}
class FarmerProfileInitial extends FarmerProfileState {
  /// {@macro farmer_profile_initial}
  const FarmerProfileInitial() : super();
}
