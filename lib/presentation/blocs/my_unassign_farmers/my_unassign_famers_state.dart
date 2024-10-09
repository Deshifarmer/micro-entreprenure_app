part of 'my_unassign_famers_bloc.dart';

abstract class MyUnassignFamersState extends Equatable {
  const MyUnassignFamersState();

  @override
  List<Object> get props => [];
}

class MyUnassignFamersInitial extends MyUnassignFamersState {}

class MyUnassignFarmerReqSuccess extends MyUnassignFamersState {
  const MyUnassignFarmerReqSuccess(this.allFarmerListResp);
  final AllFarmerListRespEntity allFarmerListResp;

  @override
  List<Object> get props => [
        allFarmerListResp,
      ];
}

class MyUnassignFarmerRequestFailed extends MyUnassignFamersState {}
