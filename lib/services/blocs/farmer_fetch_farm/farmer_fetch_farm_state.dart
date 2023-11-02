part of 'farmer_fetch_farm_bloc.dart';

sealed class FarmerFetchFarmState extends Equatable {
  const FarmerFetchFarmState();

  @override
  List<Object> get props => [];
}

final class FarmerFetchFarmInitial extends FarmerFetchFarmState {}

final class FarmerFetchFarmLoading extends FarmerFetchFarmState {}

final class FarmerFetchFarmSuccess extends FarmerFetchFarmState {
  const FarmerFetchFarmSuccess(this.allFarmListo);
  final AllFarmListResp allFarmListo;

  @override
  List<Object> get props => [allFarmListo];
}

final class FarmerFetchFarmFailed extends FarmerFetchFarmState {}
