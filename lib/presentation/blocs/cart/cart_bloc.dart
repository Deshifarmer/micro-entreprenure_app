import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

final Map<String, (ProductData, int)> _carts = <String, (ProductData, int)>{};

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<AddtoCartEvent>(_addtoCartEvent);
    on<RemoveFromCart>(_removeFromCart);
    on<ResetCart>(_resetCart);
  }
  FutureOr<void> _addtoCartEvent(AddtoCartEvent event, emit) async {
    emit(CartInitial());
    //! check if the key exists
    if (_carts.containsKey(event.productData.product_id)) {
      var currentQ = _carts[event.productData.product_id]!.$2;
      print(
        'key already exists -> $currentQ : ${_carts[event.productData.product_id]?.$1.name}',
      );
      _carts.update(
        event.productData.product_id ?? '',
        (value) => (event.productData, ++currentQ),
      );

      ///* emitting the states
      await emit(CartAddingState(_carts));
      print('q updated -> $currentQ');
    } else {
      print('${event.productData.name} not exists. adding.............');
      _carts[event.productData.product_id ?? ''] = (event.productData, 1);
      await emit(CartAddingState(_carts));
    }
  }

  FutureOr<void> _removeFromCart(RemoveFromCart event, emit) async {
    emit(CartInitial());

    //! check if the key exists
    if (_carts.containsKey(event.productData.product_id)) {
      var currentQ = _carts[event.productData.product_id]!.$2;
      print('product exists -> $currentQ');
      // currentQ--;

      //! if quantity is being 01 then remove the element
      if (currentQ == 1) {
        _carts.remove(event.productData.product_id);

        ///* emitting the states
        print('less then zero item goin to DIE');
        emit(CartAddingState(_carts));
      } else {
        //! if exists then remove it's quantity
        _carts.update(
          event.productData.product_id ?? '',
          (value) => (event.productData, --currentQ),
        );
        print('removing its q -> $currentQ');

        ///* emitting the states
        emit(CartAddingState(_carts));
      }

      //! if not then DO NOTHING
      ///! NO CODE MEANS THERE'S NOTHING (XD)
    }
  }

  FutureOr<void> _resetCart(ResetCart event, emit) async {
    emit(CartInitial());
    _carts.clear();
    emit(CartAddingState(_carts));
  }
}
