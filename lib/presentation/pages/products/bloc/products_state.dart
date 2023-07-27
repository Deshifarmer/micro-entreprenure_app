part of 'products_bloc.dart';

/// {@template products_state}
/// ProductsState description
/// {@endtemplate}
class ProductsState extends Equatable {
  /// {@macro products_state}
  const ProductsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ProductsState with property changes
  ProductsState copyWith({
    String? customProperty,
  }) {
    return ProductsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template products_initial}
/// The initial state of ProductsState
/// {@endtemplate}
class ProductsInitial extends ProductsState {
  /// {@macro products_initial}
  const ProductsInitial() : super();
}
