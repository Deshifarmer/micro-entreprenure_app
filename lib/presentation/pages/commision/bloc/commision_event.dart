part of 'commision_bloc.dart';

abstract class CommisionEvent  extends Equatable {
  const CommisionEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_commision_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomCommisionEvent extends CommisionEvent {
  /// {@macro custom_commision_event}
  const CustomCommisionEvent();
}
