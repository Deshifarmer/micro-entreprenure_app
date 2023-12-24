part of 'harvest_bloc.dart';

abstract class HarvestEvent  extends Equatable {
  const HarvestEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_harvest_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomHarvestEvent extends HarvestEvent {
  /// {@macro custom_harvest_event}
  const CustomHarvestEvent();
}
