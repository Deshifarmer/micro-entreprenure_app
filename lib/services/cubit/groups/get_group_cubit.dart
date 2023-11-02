import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/farmer_group_repo_impl.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:flutter/rendering.dart';

//getGroupFields
class GetGroupCubit extends Cubit<AllFarmerGroupFieldResp> {
  GetGroupCubit() : super(AllFarmerGroupFieldResp([]));

  final groupRepo = FarmarGroupFieldImpl();
  Future<void> addAllGroupFields(String token) async {
    debugPrint('grup called cubit');
    final userOrderResponse = await groupRepo.getFarmersGroup(token);
    final value = switch (userOrderResponse) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllFarmerGroupFieldResp) {
      debugPrint('kemming success -> ${value.farmers}');
      emit(value);
    }
  }
}
