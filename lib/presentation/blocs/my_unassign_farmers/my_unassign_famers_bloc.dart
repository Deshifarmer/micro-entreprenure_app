import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/unassign_farmer_repo_impl.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:equatable/equatable.dart';

part 'my_unassign_famers_event.dart';
part 'my_unassign_famers_state.dart';

class MyUnassignFamersBloc
    extends Bloc<MyUnassignFamersEvent, MyUnassignFamersState> {
  MyUnassignFamersBloc() : super(MyUnassignFamersInitial()) {
    on<MyUnassignFamersEvent>((event, emit) {});
    on<MyUnassignFarmerFetchEvent>(_unassignFarmerFetchEvent);
  }

  final UnassignFarmerListImpl _farmerListImpl = UnassignFarmerListImpl();

  FutureOr<void> _unassignFarmerFetchEvent(
      MyUnassignFarmerFetchEvent event, emit,) async {
    final allCompanies = await _farmerListImpl.getUnassignFarmers(event.token);
    final value = switch (allCompanies) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllFarmerListRespEntity) {
      // print('company success !');
      emit(MyUnassignFarmerReqSuccess(value));
    } else {
      // print('company failor !');

      emit(MyUnassignFarmerRequestFailed());
    }
  }
}
