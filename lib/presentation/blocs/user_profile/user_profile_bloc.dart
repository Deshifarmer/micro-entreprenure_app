import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/user_profile_repo_impl.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

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
    emit(UserProfileInitial());
    debugPrint('User Urofile event Called');

    final userProfile = await userProfileRepoImpl.userProfile(event.token);

    final value = switch (userProfile) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };

    if (value is UserProfileEntity) {
      debugPrint('UserProfileFetchSuccess user profile entity: $value');
      emit(UserProfileFetchSuccess(value));
    } else {
      debugPrint('user profile error: $value');
      emit(const UserProfileFetchFailed(message: 'User Profile Error'));
    }
  }
}
