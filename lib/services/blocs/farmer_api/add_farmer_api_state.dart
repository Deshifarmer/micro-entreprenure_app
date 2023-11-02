part of 'add_farmer_api_bloc.dart';

abstract class AddFarmerApiState extends Equatable {
  const AddFarmerApiState();

  @override
  List<Object> get props => [];
}

class AddFarmerApiInitial extends AddFarmerApiState {}

class AddFarmerAPILoadingState extends AddFarmerApiState {}

class AddFarmerAPIErrorState extends AddFarmerApiState {
  const AddFarmerAPIErrorState(this.message);
  final String message;
}

class AddFarmerAPISuccess extends AddFarmerApiState {}
