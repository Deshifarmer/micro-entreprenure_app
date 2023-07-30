part of 'pdetail_bloc.dart';

/// {@template pdetail_state}
/// PdetailState description
/// {@endtemplate}
class PdetailState extends Equatable {
  /// {@macro pdetail_state}
  const PdetailState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current PdetailState with property changes
  PdetailState copyWith({
    String? customProperty,
  }) {
    return PdetailState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template pdetail_initial}
/// The initial state of PdetailState
/// {@endtemplate}
class PdetailInitial extends PdetailState {
  /// {@macro pdetail_initial}
  const PdetailInitial() : super();
}
