part of 'farmer_fetch_farm_bloc.dart';

sealed class FarmerFetchFarmEvent extends Equatable {
  const FarmerFetchFarmEvent();

  @override
  List<Object> get props => [];
}

final class FramFetchEvent extends FarmerFetchFarmEvent {
  const FramFetchEvent({
    required this.token,
    required this.farmerID,
  });
  final String token;
  final String farmerID;
}

final class FarmResetEvent extends FarmerFetchFarmEvent {
  const FarmResetEvent();
}