part of 'products_bloc.dart';

abstract class ProductsSState extends Equatable {
  const ProductsSState();

  @override
  List<Object> get props => [];
}

class ProductsIInitial extends ProductsSState {}

class ProductFailed extends ProductsSState {}

class ProductSSuccess extends ProductsSState {
  const ProductSSuccess({
    required this.productEntity,
    required this.productDatas,
  });
  final ProductEntity productEntity;
  final List<ProductData> productDatas;
  @override
  List<Object> get props => [productEntity];
}
