// ProductLinks
import 'package:json_annotation/json_annotation.dart';

part 'farmer_link_entity.g.dart';

@JsonSerializable()
class FarmerLinks {
  FarmerLinks({
    required this.first,
    required this.last,
    required this.next,
    required this.prev,
  });

  /// factory.
  factory FarmerLinks.fromJson(Map<String, dynamic> json) =>
      _$FarmerLinksFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final String? first;
  final String? last;
  final String? prev;
  final String? next;
}
