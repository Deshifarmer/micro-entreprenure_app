part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super();
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.successLoginEntity);
  final SuccessLoginEntity successLoginEntity;

  @override
  List<Object> get props => [successLoginEntity];
}

class LoginFailed extends LoginState {}
