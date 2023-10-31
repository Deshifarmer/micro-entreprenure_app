import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_links_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_orders.g.dart';

@JsonSerializable()
class AllOrdersEntity {
  AllOrdersEntity({
    required this.data,
    required this.links,
    required this.meta,
  });

  /// factory.
  factory AllOrdersEntity.fromJson(Map<String, dynamic> json) =>
      _$AllOrdersEntityFromJson(json);

  final List<OrderEntity> data;
  final ProductLinks? links;
  final ProductMeta? meta;
}
