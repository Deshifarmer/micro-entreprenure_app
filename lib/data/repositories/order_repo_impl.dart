import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';
import 'package:deshifarmer/domain/repositories/order_repo.dart';

class UserOrderRepoImpl extends UserOrderRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<AllOrdersEntity, Exception>> userOrder(
    String token,
  ) {
    return _dfAPi.userOrder(token);
  }
}
