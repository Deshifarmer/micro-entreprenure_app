import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/data/models/cart_model.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<AddtoCartEvent>(_addtoCartEvent);
  }
  final Map<String, CartModel> _carts = <String, CartModel>{};
  FutureOr<void> _addtoCartEvent(AddtoCartEvent event, emit) async {
    //! check if the key exists
    if (_carts.containsKey(event.productData.product_id)) {
      //!---------------DO NOT REMOVE--------------------!!!
      if (event.quantity == 0) {
        _carts.remove(event.productData.product_id);
      }
      //!------- then update it's value (only quantity)
      _carts.update(
        event.productData.product_id ?? '',
        (value) => CartModel(
          productData: event.productData,
          quantity: event.quantity,
        ),
      );
    } else
    //! if not then add the key+value
    {
      _carts[event.productData.product_id ?? ''] = CartModel(
        productData: event.productData,
        quantity: event.quantity,
      );
    }

    ///* emitting the states
    emit(CartAddingState(_carts));
  }
}
