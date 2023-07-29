import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsInitial()) {
    on<CustomProductsEvent>(_onCustomProductsEvent);
    on<SelectCompanysEvent>(_selectCompanyEvent);
    on<UnSelectCompanyEvent>(_unSelectCompanyEvent);
  }

  FutureOr<void> _onCustomProductsEvent(
    CustomProductsEvent event,
    Emitter<ProductsState> emit,
  ) {}

  ///? Select company
  FutureOr<void> _selectCompanyEvent(
    SelectCompanysEvent event,
    Emitter<ProductsState> emit,
  ) {
    print('selecting company -> ${event.companyID}');
    emit(ProductComanySelect(event.companyID));
  }

  ///? unselect company
  FutureOr<void> _unSelectCompanyEvent(
    UnSelectCompanyEvent event,
    Emitter<ProductsState> emit,
  ) {
    emit(const ProductsInitial());
  }
}
