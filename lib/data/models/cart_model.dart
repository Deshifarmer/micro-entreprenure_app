import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  const CartModel({
    required this.productData,
    required this.quantity,
  });

  final int quantity;
  final ProductData productData;

  @override
  List<Object?> get props => [quantity, productData];
}
