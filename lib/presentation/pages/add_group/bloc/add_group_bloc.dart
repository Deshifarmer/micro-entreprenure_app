import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'add_group_event.dart';
part 'add_group_state.dart';

class AddGroupBloc extends Bloc<AddGroupEvent, AddGroupState> {
  AddGroupBloc()
      : super(
          AddGroupInitial(),
        ) {
    on<CustomAddGroupEvent>(_onCustomAddGroupEvent);
  }

  final DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();

  FutureOr<void> _onCustomAddGroupEvent(
    CustomAddGroupEvent event,
    Emitter<AddGroupState> emit,
  ) async {
    var result = await deshiFarmerAPI.createGroup(
      event.token,
      event.groupName,
      event.leaderID,
    );

    final value = switch (result) {
      Success(data: final bool _) => emit(GroupCreatedSuccessfully()),
      ServerFailor(error: final _) => emit(GroupCreatedFailed()),
    };
  }
}
