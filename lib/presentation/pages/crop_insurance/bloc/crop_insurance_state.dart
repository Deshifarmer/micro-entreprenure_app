part of 'crop_insurance_bloc.dart';

/// {@template crop_insurance_state}
/// CropInsuranceState description
/// {@endtemplate}
class CropInsuranceState extends Equatable {
  /// {@macro crop_insurance_state}
  const CropInsuranceState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CropInsuranceState with property changes
  CropInsuranceState copyWith({
    String? customProperty,
  }) {
    return CropInsuranceState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template crop_insurance_initial}
/// The initial state of CropInsuranceState
/// {@endtemplate}
class CropInsuranceInitial extends CropInsuranceState {
  /// {@macro crop_insurance_initial}
  CropInsuranceInitial() : super();

  final TextEditingController farmerID = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController harvestPeriod = TextEditingController();
  final TextEditingController notes = TextEditingController();
}
