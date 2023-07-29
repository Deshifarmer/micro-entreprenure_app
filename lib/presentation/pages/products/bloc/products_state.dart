part of 'products_bloc.dart';

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

class ProductsInitial extends ProductsState {
  /// {@macro products_initial}
  const ProductsInitial() : super();
}

class ProductComanySelect extends ProductsState {
  const ProductComanySelect(this.companyID);
  final String companyID;
  @override
  List<Object> get props => [companyID];
}
