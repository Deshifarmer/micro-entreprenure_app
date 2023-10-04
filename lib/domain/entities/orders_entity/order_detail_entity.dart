// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names

import 'package:deshifarmer/domain/entities/orders_entity/product_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_detail_entity.g.dart';

@JsonSerializable()
class OrderDetailEntity {
  OrderDetailEntity({
    required this.created_at,
    required this.delivery_address,
    required this.delivery_contact,
    required this.distributor_id,
    required this.distributor_name,
    required this.farmer_address,
    required this.farmer_id,
    required this.farmer_name,
    required this.id,
    required this.location,
    required this.me_id,
    required this.me_order_id,
    required this.product_details,
    required this.product_id,
    required this.quantity,
    required this.status,
    required this.total_price,
    required this.unit,
  });

  /// factory.
  factory OrderDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names

  final int? id;
  // final int? quantity; //! LOCAL
  final String? quantity; //! Server
  // final int? total_price;//! LOCAL
  final String? total_price; //! server
  final ProductDetailEntity? product_details;
  final String? me_order_id;
  final String? me_id;
  final String? distributor_id;
  final String? distributor_name;
  final String? delivery_address;
  final String? delivery_contact;
  final String? product_id;
  final String? unit;
  final String? status;
  final String? created_at;
  final String? location;
  final String? farmer_id;
  final String? farmer_name;
  final String? farmer_address;
}
