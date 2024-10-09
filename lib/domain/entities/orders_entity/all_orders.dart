import 'package:deshifarmer/domain/entities/orders_entity/order_link_entity.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_meta.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
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
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final List<OrderEntity> data;
  final OrderLinks? links;
  final OrderMeta? meta;
}
