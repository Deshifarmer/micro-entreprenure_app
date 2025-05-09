part of 'profile_bloc.dart';

/// {@template profile_state}
/// ProfileState description
/// {@endtemplate}
class ProfileState extends Equatable {
  /// {@macro profile_state}
  const ProfileState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ProfileState with property changes
  ProfileState copyWith({
    String? customProperty,
  }) {
    return ProfileState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template profile_initial}
/// The initial state of ProfileState
/// {@endtemplate}
class ProfileInitial extends ProfileState {
  /// {@macro profile_initial}
  const ProfileInitial() : super();
}
