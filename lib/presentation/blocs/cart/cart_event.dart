part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddtoCartEvent extends CartEvent {
  const AddtoCartEvent({
    required this.productData,
    // required this.quantity,
  });
  // final int quantity;
  final ProductData productData;
}

// class RemoveFromCart extends Equatable{}
class RemoveFromCart extends CartEvent {
  const RemoveFromCart({
    required this.productData,
    // required this.quantity,
  });
  // final int quantity;
  final ProductData productData;
}
