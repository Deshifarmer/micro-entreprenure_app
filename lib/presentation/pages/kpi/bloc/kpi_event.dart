part of 'kpi_bloc.dart';

abstract class KpiEvent  extends Equatable {
  const KpiEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_kpi_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomKpiEvent extends KpiEvent {
  /// {@macro custom_kpi_event}
  const CustomKpiEvent();
}
