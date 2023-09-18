part of 'farmadd_form_bloc.dart';

/// {@template farmadd_form_state}
/// FarmaddFormState description
/// {@endtemplate}
class FarmaddFormState extends Equatable {
  /// {@macro farmadd_form_state}
  const FarmaddFormState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current FarmaddFormState with property changes
  FarmaddFormState copyWith({
    String? customProperty,
  }) {
    return FarmaddFormState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template farmadd_form_initial}
/// The initial state of FarmaddFormState
/// {@endtemplate}
class FarmaddFormInitial extends FarmaddFormState {
  /// {@macro farmadd_form_initial}
  FarmaddFormInitial() : super();

  final TextEditingController farmName = TextEditingController();
  final TextEditingController farmerID = TextEditingController();
  final TextEditingController farmLocation = TextEditingController();
  final TextEditingController farmUnion = TextEditingController();
  final TextEditingController farmMouzza = TextEditingController();
  final TextEditingController farmLength = TextEditingController();
  final TextEditingController farmSoilType = TextEditingController();
  final TextEditingController farmStartingDate = TextEditingController();
  final TextEditingController farmProducingCrop = TextEditingController();
  final TextEditingController farmArea = TextEditingController();
  final List<XFile> images = [];

  @override
  List<Object> get props => [images];
}

class FarmAddLoading extends FarmaddFormState {}

class FarmAddingFailed extends FarmaddFormState {}

// FarmAddingSuccess
class FarmAddingSuccess extends FarmaddFormState {}
