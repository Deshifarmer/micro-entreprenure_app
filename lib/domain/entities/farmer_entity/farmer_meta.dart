// ignore_for_file: non_constant_identifier_names

import 'package:deshifarmer/domain/entities/products_entity/product_meta_links_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farmer_meta.g.dart';

@JsonSerializable()
class FarmerMeta {
  FarmerMeta({
    required this.links,
    required this.current_page,
    required this.form,
    required this.last_page,
    required this.path,
    required this.per_page,
    required this.to,
    required this.total,
  });

  /// factory.
  factory FarmerMeta.fromJson(Map<String, dynamic> json) =>
      _$FarmerMetaFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final int? current_page;
  final int? form;
  final int? last_page;
  final String? path;
  final int? per_page;
  final int? to;
  final int? total;
  final List<ProductMetaLinks> links;
}
