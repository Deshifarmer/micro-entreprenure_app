part of 'cartz_bloc.dart';

/// {@template cartz_state}
/// CartzState description
/// {@endtemplate}
class CartzState extends Equatable {
  /// {@macro cartz_state}
  const CartzState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CartzState with property changes
  CartzState copyWith({
    String? customProperty,
  }) {
    return CartzState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template cartz_initial}
/// The initial state of CartzState
/// {@endtemplate}
class CartzInitial extends CartzState {
  /// {@macro cartz_initial}
  const CartzInitial() : super();
}
