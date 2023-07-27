// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'product_detail_entity.g.dart';

@JsonSerializable()
class ProductDetailEntity {
  ProductDetailEntity({
    required this.company_id,
    required this.category,
    required this.company,
    required this.description,
    required this.discount,
    required this.image,
    required this.name,
    required this.preferred,
    required this.product_id,
    required this.sell_price,
    required this.status,
    required this.subcategory,
    required this.total_order,
    required this.unit_id,
  });

  /// factory.
  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line

  final String? product_id;
  final String? name;
  final String? image;
  final String? description;
  final String? category;
  final String? company_id;
  final String? company;
  final String? unit_id;
  final String? sell_price;
  final String? status;

  final int? total_order;
  final String? preferred;
  final String? subcategory;
  final String? discount;
}
