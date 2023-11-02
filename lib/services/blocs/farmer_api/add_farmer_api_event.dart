part of 'add_farmer_api_bloc.dart';

abstract class AddFarmerApiEvent extends Equatable {
  const AddFarmerApiEvent();

  @override
  List<Object> get props => [];
}

class AddFarmerBtnPressEvent extends AddFarmerApiEvent {
  const AddFarmerBtnPressEvent({
    required this.farmerModel,
    required this.token,
  });
  final String token;
  final AddFarmerModel farmerModel;
}
