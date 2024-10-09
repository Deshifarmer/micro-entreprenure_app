import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/farmer_repo_impl.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:equatable/equatable.dart';

part 'my_farmer_event.dart';
part 'my_farmer_state.dart';

class MyFarmerBloc extends Bloc<MyFarmerEvent, MyFarmerState> {
  MyFarmerBloc() : super(MyFarmerInitial()) {
    on<MyFarmerEvent>((event, emit) {});
    on<MyFarmerFetchEvent>(_farmerFetchEvent);
  }
  final FarmerListImpl _farmerListImpl = FarmerListImpl();
  //? my farmer fetch event
  FutureOr<void> _farmerFetchEvent(MyFarmerFetchEvent event, emit) async {
    final allCompanies = await _farmerListImpl.getFarmers(event.token);
    final value = switch (allCompanies) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllFarmerListRespEntity) {
      // print('company success !');
      emit(MyFarmerSuccess(value));
    } else {
      // print('company failor !');

      emit(MyFarmerFailed(message: value.toString()));
    }
  }
}
