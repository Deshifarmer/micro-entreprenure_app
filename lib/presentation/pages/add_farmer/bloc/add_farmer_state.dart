part of 'add_farmer_bloc.dart';

/// {@template add_farmer_state}
/// AddFarmerState description
/// {@endtemplate}
class AddFarmerState extends Equatable {
  /// {@macro add_farmer_state}
  const AddFarmerState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddFarmerState with property changes
  AddFarmerState copyWith({
    String? customProperty,
  }) {
    return AddFarmerState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template add_farmer_initial}
/// The initial state of AddFarmerState
/// {@endtemplate}
class AddFarmerInitial extends AddFarmerState {
  /// {@macro add_farmer_initial}
  const AddFarmerInitial() : super();
}
