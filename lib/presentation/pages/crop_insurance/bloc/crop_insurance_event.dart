part of 'crop_insurance_bloc.dart';

abstract class CropInsuranceEvent  extends Equatable {
  const CropInsuranceEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_crop_insurance_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomCropInsuranceEvent extends CropInsuranceEvent {
  /// {@macro custom_crop_insurance_event}
  const CustomCropInsuranceEvent();
}
