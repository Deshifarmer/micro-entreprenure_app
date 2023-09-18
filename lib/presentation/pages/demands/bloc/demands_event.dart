part of 'demands_bloc.dart';

abstract class DemandsEvent  extends Equatable {
  const DemandsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_demands_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomDemandsEvent extends DemandsEvent {
  /// {@macro custom_demands_event}
  const CustomDemandsEvent();
}
