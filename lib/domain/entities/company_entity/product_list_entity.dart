// ignore_for_file: non_constant_identifier_names, avoid_multiple_declarations_per_line

import 'package:json_annotation/json_annotation.dart';
part 'product_list_entity.g.dart';

@JsonSerializable()
class ProductListEntity {
  ProductListEntity({
    required this.role,
    required this.buy_price_from_company,
    required this.image,
    required this.product_id,
    required this.product_name,
    required this.sell_price_from_company,
  });

  /// factory.
  factory ProductListEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductListEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? product_id,
      product_name,
      image,
      buy_price_from_company,
      sell_price_from_company;
  final String? role;
}
