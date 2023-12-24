import 'package:bloc/bloc.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/group_farmer_entity.dart';
import 'package:equatable/equatable.dart';

part 'list_for_farmers_state.dart';

class ListForFarmersCubit extends Cubit<ListForFarmersState> {
  ListForFarmersCubit() : super(ListForFarmersInitial());

  void addListForFarmers(List<GroupFarmerEntity> farmers) {
    emit(ListForFarmersInitial());
    emit(AddingListForFarmers(farmers: farmers));
  }

  void resetListForFarmers() {
    emit(ResetListForFarmers());
  }
}
