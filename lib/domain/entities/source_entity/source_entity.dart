// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'source_entity.g.dart';

@JsonSerializable()
class SourcingEntity {
  SourcingEntity({
    required this.source_id,
    required this.product_name,
    required this.product_images,
    required this.buy_price,
    required this.sell_price,
    required this.quantity,
    required this.unit,
    required this.description,
    required this.category,
    required this.which_farmer,
    // required this.source_by,
    required this.transportation_id,
    required this.created_at,
    required this.farmer_name,
  });

  /// factory.
  factory SourcingEntity.fromJson(Map<String, dynamic> json) =>
      _$SourcingEntityFromJson(json);
  final String source_id;
  final String product_name;
  final String unit;
  final String description;
  final String? category;
  final String which_farmer;
  final String farmer_name;
  // final String source_by;
  final String? transportation_id;
  final String? sell_price;
  // final double? sell_price;
  final String quantity;
  // final int quantity; //!LOCAL
  final String buy_price;
  // final double buy_price;
  final List<String> product_images;
  final String created_at;
}
