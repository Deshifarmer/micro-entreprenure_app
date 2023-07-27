import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_links_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  ProductEntity({
    required this.data,
    required this.links,
    required this.meta,
  });

  /// factory.
  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final List<ProductData>? data;
  final ProductLinks? links;
  final ProductMeta? meta;
}
