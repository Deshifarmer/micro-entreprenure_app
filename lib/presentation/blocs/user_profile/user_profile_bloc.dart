import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/user_profile_repo_impl.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:equatable/equatable.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) {});
    on<GetUserProfileEvent>(_onGetUserProEvent);
  }
  final UserProfileRepoImpl userProfileRepoImpl = UserProfileRepoImpl();

  FutureOr<void> _onGetUserProEvent(
    GetUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    final userProfile = await userProfileRepoImpl.userProfile(event.token);

    final value = switch (userProfile) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };

    if (value is UserProfileEntity) {
      print('user profile entity: $value');
      emit(UserProfileFetchSuccess(value));
    } else {
      print('user profile error: $value');
      emit(UserProfileFetchFailed());
    }
  }
}
