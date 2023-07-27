// ignore_for_file: avoid_dynamic_calls, unnecessary_cast

import 'dart:async';

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/login_repo_impl.dart';
import 'package:deshifarmer/domain/entities/login_entity/login_response_entity.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<CheckLoginEvent>(_onSuccessLoginEvent);
  }
  LoginRepoImpl loginRepoImpl = LoginRepoImpl();

  // on success login event
  FutureOr<void> _onSuccessLoginEvent(
    CheckLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await loginRepoImpl.login(
      event.mail,
      event.pass,
    );
    final value = switch (result) {
      Success(data: final SuccessLoginEntity succ) => {
          emit(LoginSuccess(succ)),
          await Navigator.pushAndRemoveUntil(
            event.context as BuildContext,
            HomePage.route(),
            (route) => false,
          )
        },
      ServerFailor(error: final _) => emit(LoginFailed()),
    };
  }
}
