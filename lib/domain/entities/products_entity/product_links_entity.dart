// ProductLinks
import 'package:json_annotation/json_annotation.dart';

part 'product_links_entity.g.dart';

@JsonSerializable()
class ProductLinks {
  ProductLinks({
    required this.first,
    required this.last,
    required this.next,
    required this.prev,
  });

  /// factory.
  factory ProductLinks.fromJson(Map<String, dynamic> json) =>
      _$ProductLinksFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? first;
  final String? last;
  final String? prev;
  final int? next;
}
