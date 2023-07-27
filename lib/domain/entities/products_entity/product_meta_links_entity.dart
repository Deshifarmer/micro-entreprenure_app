import 'package:json_annotation/json_annotation.dart';

part 'product_meta_links_entity.g.dart';

@JsonSerializable()
class ProductMetaLinks {
  ProductMetaLinks({
    required this.active,
    required this.label,
    required this.url,
  });

  /// factory.
  factory ProductMetaLinks.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaLinksFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? url;
  final String? label;
  final bool? active;
}
