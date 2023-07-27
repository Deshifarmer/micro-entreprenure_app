import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsInitial()) {
    on<CustomProductsEvent>(_onCustomProductsEvent);
  }

  FutureOr<void> _onCustomProductsEvent(
    CustomProductsEvent event,
    Emitter<ProductsState> emit,
  ) {
    // TODO: Add Logic
  }
}
