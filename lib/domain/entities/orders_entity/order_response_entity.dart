// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names

import 'package:deshifarmer/domain/entities/orders_entity/farmer_detail_entity.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_response_entity.g.dart';

@JsonSerializable()
class OrderEntity {
  OrderEntity({
    required this.channel_id,
    required this.created_at,
    required this.delivery_status,
    required this.distributor_commission,
    required this.farmerDetail,
    required this.me_commission,
    required this.me_id,
    required this.orderDetail,
    required this.order_id,
    required this.payment_id,
    required this.payment_method,
    required this.sold_to,
    required this.status,
    required this.total_price,
    required this.updated_at,
  });

  /// factory.
  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
  final String? order_id;
  // ignore: avoid_multiple_declarations_per_line
  final String? me_id;
  final String? channel_id;
  final String? total_price;
  final String? sold_to;
  final String? status;
  final String? payment_method;
  final String? payment_id;
  final String? delivery_status;
  final String? distributor_commission;
  final String? me_commission;
  final String? created_at;
  final String? updated_at;
  final FarmerDetailEntity? farmerDetail;
  final List<OrderDetailEntity>? orderDetail;
}
