import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';

// ignore: one_member_abstracts
abstract class ProductRepo {
  Future<Result<ProductEntity, Exception>> getProductListo(
    String token,
  );
  Future<Result<ProductEntity, Exception>> getProductListoPaginate(
      String token, String page,);
}
