part of 'list_for_farmers_cubit.dart';

sealed class ListForFarmersState extends Equatable {
  const ListForFarmersState();

  @override
  List<Object> get props => [];
}

final class ListForFarmersInitial extends ListForFarmersState {}
final class AddingListForFarmers extends ListForFarmersState {
  const AddingListForFarmers({
    required this.farmers,
  });
  final List<GroupFarmerEntity> farmers;
}
final class ResetListForFarmers extends ListForFarmersState {}
