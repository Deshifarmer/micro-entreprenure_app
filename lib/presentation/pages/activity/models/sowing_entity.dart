// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'sowing_entity.g.dart';

@JsonSerializable()
class SowingEntity {
  SowingEntity({
    required this.id,
    // required this.batch_id,
    required this.seed_name,
    required this.seed_company,
    required this.seed_price,
    required this.seed_quantity,
    required this.seed_unit,
    required this.details,
  });

  factory SowingEntity.fromJson(Map<String, dynamic> json) =>
      _$SowingEntityFromJson(json);
  final int id;
  // final String batch_id;
  final String? seed_name;
  final String? seed_company;
  final String? seed_price;
  final String? seed_quantity;
  final String? seed_unit;
  final String? details;
}
