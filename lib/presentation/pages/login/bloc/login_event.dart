part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_login_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomLoginEvent extends LoginEvent {
  /// {@macro custom_login_event}
  const CustomLoginEvent();
}

/// goto a new page
class CheckLoginEvent extends LoginEvent {
  const CheckLoginEvent({
    required this.context,
    required this.mail,
    required this.pass,
  });
  final BuildContext context;
  final String mail;
  final String pass;
  @override
  List<Object> get props => [mail, pass, context];
}

/// login success event from local
class LoginSuccessEvent extends LoginEvent {
  const LoginSuccessEvent({
    // required this.context,
    required this.token,
  });
  // final BuildContext context;
  final String token;
  @override
  List<Object> get props => [
        token,
      ];
}

// Reset Login Event
class ResetLoginEvent extends LoginEvent {
  const ResetLoginEvent();
}
