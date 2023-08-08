part of 'farmer_listo_bloc.dart';

abstract class FarmerListoEvent  extends Equatable {
  const FarmerListoEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_farmer_listo_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomFarmerListoEvent extends FarmerListoEvent {
  /// {@macro custom_farmer_listo_event}
  const CustomFarmerListoEvent();
}
