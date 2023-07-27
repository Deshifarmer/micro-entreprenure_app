part of 'products_bloc.dart';

abstract class ProductsEvent  extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_products_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomProductsEvent extends ProductsEvent {
  /// {@macro custom_products_event}
  const CustomProductsEvent();
}
