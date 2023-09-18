part of 'logistic_bloc.dart';

abstract class LogisticEvent  extends Equatable {
  const LogisticEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_logistic_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomLogisticEvent extends LogisticEvent {
  /// {@macro custom_logistic_event}
  const CustomLogisticEvent();
}
