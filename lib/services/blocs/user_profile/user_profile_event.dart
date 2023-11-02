part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileEvent extends UserProfileEvent {
  /// {@macro custom_home_event}
  const GetUserProfileEvent({
    required this.token,
  });
  final String token;
}
