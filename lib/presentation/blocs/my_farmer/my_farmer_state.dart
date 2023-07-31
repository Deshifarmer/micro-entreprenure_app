part of 'my_farmer_bloc.dart';

abstract class MyFarmerState extends Equatable {
  const MyFarmerState();

  @override
  List<Object> get props => [];
}

class MyFarmerInitial extends MyFarmerState {}

class MyFarmerSuccess extends MyFarmerState {
  const MyFarmerSuccess(this.allFarmerListResp);
  final AllFarmerListResp allFarmerListResp;

  @override
  List<Object> get props => [
        allFarmerListResp,
      ];
}

class MyFarmerFailed extends MyFarmerState {}
