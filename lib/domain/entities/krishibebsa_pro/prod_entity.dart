import 'package:json_annotation/json_annotation.dart';

part 'prod_entity.g.dart';

@JsonSerializable()
class KrishibebshaProd {
  KrishibebshaProd({
    required this.id,
    required this.name,
    required this.image,
  });

  /// factory.
  factory KrishibebshaProd.fromJson(Map<String, dynamic> json) =>
      _$KrishibebshaProdFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final int id;
  final String name;
  final String image;
}
