import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/group_detail_repo_imp.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:equatable/equatable.dart';
part 'group_detail_event.dart';
part 'group_detail_state.dart';

class GroupDetailBloc extends Bloc<GroupDetailEvent, GroupDetailState> {
  GroupDetailBloc() : super(const GroupDetailInitial()) {
    // on<CustomGroupDetailEvent>(_onCustomGroupDetailEvent);
    on<GroupDetailFetchEvent>(_onGroupDetailFetchEvent);
  }
  GroupDetailRepoImpl groupDetailRepoImpl = GroupDetailRepoImpl();
  FutureOr<void> _onGroupDetailFetchEvent(
    GroupDetailFetchEvent event,
    Emitter<GroupDetailState> emit,
  ) async {
    emit(GroupDetailLoading());

    ///! get the value
    final groupDetail =
        await groupDetailRepoImpl.getGroupDetails(event.token, event.groupID);

    final value = switch (groupDetail) {
      Success(data: final succ) =>
        emit(GroupDetailFetchSuccessFull(groupDetailEntity: succ)),
      ServerFailor(error: final err) =>
        emit(GroupDetailFetchFailed(message: err.toString())),
    };
  }
}
