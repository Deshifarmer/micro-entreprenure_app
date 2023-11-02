part of 'my_farmer_bloc.dart';

abstract class MyFarmerEvent extends Equatable {
  const MyFarmerEvent();

  @override
  List<Object> get props => [];
}

class MyFarmerFetchEvent extends MyFarmerEvent {
  const MyFarmerFetchEvent(this.token);
  final String token;
}
