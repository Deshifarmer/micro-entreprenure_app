// ignore_for_file: non_constant_identifier_names, avoid_multiple_declarations_per_line

import 'package:json_annotation/json_annotation.dart';
part 'category_entity.g.dart';

@JsonSerializable()
class CategoryEntity {
  CategoryEntity({
    required this.id,
    required this.image,
    required this.is_active,
    required this.title,
    required this.total_product,
  });

  /// factory.
  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  final int id;
  final int total_product;
  final String title;
  final String image;
  final String is_active;
  // final List<ProductListEntity> product_list;
}
