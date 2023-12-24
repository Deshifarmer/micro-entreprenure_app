part of 'order_bloc.dart';

/// {@template order_state}
/// OrderState description
/// {@endtemplate}
class OrderState extends Equatable {
  /// {@macro order_state}
  const OrderState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current OrderState with property changes
  OrderState copyWith({
    String? customProperty,
  }) {
    return OrderState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template order_initial}
/// The initial state of OrderState
/// {@endtemplate}
class OrderInitial extends OrderState {
  /// {@macro order_initial}
  const OrderInitial() : super();
}

class OrderSuccess extends OrderState {
  const OrderSuccess(this.orderEntitys);
  final AllOrdersEntity orderEntitys;
}

class OrderFetchFailed extends OrderState {
  const OrderFetchFailed({required this.message});
  final String message;
}
