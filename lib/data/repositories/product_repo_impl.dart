import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/domain/repositories/product_response_repo.dart';

class ProductListRepoImpl extends ProductRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();
  @override
  Future<Result<ProductEntity, Exception>> getProductListo(String token) {
    return _dfAPi.getProducts(token);
  }

  @override
  Future<Result<ProductEntity, Exception>> getProductListoPaginate(
      String token, int page,) {
    return _dfAPi.getProductsPaginate(token, page);
  }
}
