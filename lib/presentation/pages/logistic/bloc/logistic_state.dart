part of 'logistic_bloc.dart';

/// {@template logistic_state}
/// LogisticState description
/// {@endtemplate}
class LogisticState extends Equatable {
  /// {@macro logistic_state}
  const LogisticState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current LogisticState with property changes
  LogisticState copyWith({
    String? customProperty,
  }) {
    return LogisticState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template logistic_initial}
/// The initial state of LogisticState
/// {@endtemplate}
class LogisticInitial extends LogisticState {
  /// {@macro logistic_initial}
  const LogisticInitial() : super();
}
