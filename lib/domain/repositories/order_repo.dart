// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';

import '../entities/farmer_entity/all_farmer_entity.dart';

abstract class UserOrderRepo {
  Future<Result<AllOrdersEntity, Exception>> userOrder(
    String token,
  );
}
