part of 'cartz_bloc.dart';

abstract class CartzEvent  extends Equatable {
  const CartzEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_cartz_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomCartzEvent extends CartzEvent {
  /// {@macro custom_cartz_event}
  const CustomCartzEvent();
}
