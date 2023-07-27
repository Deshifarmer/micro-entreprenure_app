part of 'products_bloc.dart';

abstract class ProductsSState extends Equatable {
  const ProductsSState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsSState {}

class ProductFailed extends ProductsSState {}

class ProductSuccess extends ProductsSState {
  const ProductSuccess({
    required this.productEntity,
    required this.productDatas,
  });
  final ProductEntity productEntity;
  final List<ProductData> productDatas;
  @override
  List<Object> get props => [productEntity];
}
