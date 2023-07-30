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

  @override
  List<Object> get props => [carts];
}
