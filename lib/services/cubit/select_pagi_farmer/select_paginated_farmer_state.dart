part of 'select_paginated_farmer_cubit.dart';

sealed class SelectPaginatedFarmerState extends Equatable {
  const SelectPaginatedFarmerState();

  @override
  List<Object> get props => [];
}

final class SelectPaginatedFarmerInitial extends SelectPaginatedFarmerState {}

final class SelectPaginatedFarmer extends SelectPaginatedFarmerState {
  const SelectPaginatedFarmer(this.farmerEntity);
  final FarmerEntity farmerEntity;
}
