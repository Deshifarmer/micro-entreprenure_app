part of 'farmer_profile_bloc.dart';

abstract class FarmerProfileEvent  extends Equatable {
  const FarmerProfileEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_farmer_profile_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomFarmerProfileEvent extends FarmerProfileEvent {
  /// {@macro custom_farmer_profile_event}
  const CustomFarmerProfileEvent();
}
