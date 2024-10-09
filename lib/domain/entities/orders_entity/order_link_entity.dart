// ProductLinks
import 'package:json_annotation/json_annotation.dart';

part 'order_link_entity.g.dart';

@JsonSerializable()
class OrderLinks {
  OrderLinks({
    required this.first,
    required this.last,
    required this.next,
    required this.prev,
  });

  /// factory.
  factory OrderLinks.fromJson(Map<String, dynamic> json) =>
      _$OrderLinksFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? first;
  final String? last;
  final String? prev;
  final String? next;
}
