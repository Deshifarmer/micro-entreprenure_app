part of 'add_farmer_bloc.dart';

abstract class AddFarmerEvent  extends Equatable {
  const AddFarmerEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_add_farmer_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAddFarmerEvent extends AddFarmerEvent {
  /// {@macro custom_add_farmer_event}
  const CustomAddFarmerEvent();
}
