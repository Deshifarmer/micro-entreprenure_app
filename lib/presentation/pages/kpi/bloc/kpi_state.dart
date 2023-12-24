part of 'kpi_bloc.dart';

/// {@template kpi_state}
/// KpiState description
/// {@endtemplate}
class KpiState extends Equatable {
  /// {@macro kpi_state}
  const KpiState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current KpiState with property changes
  KpiState copyWith({
    String? customProperty,
  }) {
    return KpiState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template kpi_initial}
/// The initial state of KpiState
/// {@endtemplate}
class KpiInitial extends KpiState {
  /// {@macro kpi_initial}
  const KpiInitial() : super();
}
