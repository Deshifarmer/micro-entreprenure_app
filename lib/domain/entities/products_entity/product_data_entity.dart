// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'product_data_entity.g.dart';

@JsonSerializable()
class ProductData {
  ProductData({
    required this.category,
    required this.company_id,
    required this.description,
    required this.discount,
    required this.name,
    required this.preferred,
    required this.product_id,
    required this.sell_price,
    required this.status,
    required this.subcategory,
    required this.total_order,
    required this.unit_id,
    required this.image,
    required this.company,
  });

  /// factory.
  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? product_id;
  final String? name;
  final String image;
  final String? company;
  final String? description;
  final String? preferred;
  final String? category;
  final String? subcategory;
  final String? company_id;
  final String? unit_id;
  final String? sell_price;
  final String? discount;
  final String? status;
  final int? total_order;
}
