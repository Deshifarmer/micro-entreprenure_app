// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'farmer_order_entity.g.dart';

@JsonSerializable()
class FarmerOrderEntity {
  FarmerOrderEntity({
    required this.order_id,
    required this.me_id,
    required this.channel_id,
    required this.total_price,
    required this.sold_to,
    required this.status,
    required this.payment_method,
    required this.payment_id,
    required this.delivery_status,
    required this.me_commission,
    required this.distributor_commission,
    required this.created_at,
    required this.updated_at,
    required this.total_item,
  });

  factory FarmerOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$FarmerOrderEntityFromJson(json);
  final String order_id;
  final String me_id;
  final String channel_id;
  final String total_price;
  final String sold_to;
  final String status;
  final String payment_method;
  final String payment_id;
  final String delivery_status;
  final String me_commission;
  final String distributor_commission;
  final String created_at;
  final String updated_at;
  final int total_item;
}
