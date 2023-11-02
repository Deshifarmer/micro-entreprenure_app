part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileFetchSuccess extends UserProfileState {
  const UserProfileFetchSuccess(this.userProfile);
  final UserProfileEntity userProfile;
}

class UserProfileFetchFailed extends UserProfileState {
  const UserProfileFetchFailed({
    required this.message,
  });
  final String message;
}
