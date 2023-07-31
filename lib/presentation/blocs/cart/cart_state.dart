part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartAddingState extends CartState {
  const CartAddingState(this.carts);
  final Map<String, (ProductData, int)> carts;

  double getTotalPrices() {
    var total = 0.0;
    for (final element in carts.values) {
      total =
          total + (element.$2 * double.parse(element.$1.sell_price ?? '0'));
    }

    return total;
  }

  @override
  List<Object> get props => [carts];
}
