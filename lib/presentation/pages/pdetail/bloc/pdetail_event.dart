part of 'pdetail_bloc.dart';

abstract class PdetailEvent  extends Equatable {
  const PdetailEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_pdetail_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomPdetailEvent extends PdetailEvent {
  /// {@macro custom_pdetail_event}
  const CustomPdetailEvent();
}
