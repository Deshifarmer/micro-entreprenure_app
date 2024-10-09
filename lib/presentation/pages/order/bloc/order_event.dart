part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_order_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class InitOrders extends OrderEvent {
  /// {@macro custom_order_event}
  const InitOrders(this.token);
  final String token;
}
