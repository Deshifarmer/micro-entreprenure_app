part of 'my_unassign_famers_bloc.dart';

abstract class MyUnassignFamersEvent extends Equatable {
  const MyUnassignFamersEvent();

  @override
  List<Object> get props => [];
}

class MyUnassignFarmerFetchEvent extends MyUnassignFamersEvent {
  const MyUnassignFarmerFetchEvent(this.token);
  final String token;
}
