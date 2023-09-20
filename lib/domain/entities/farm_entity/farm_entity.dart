// ignore_for_file: avoid_multiple_declarations_per_line, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'farm_entity.g.dart';

@JsonSerializable()
class FarmEntity {
  FarmEntity({
    // required this.isActive,
    required this.long,
    required this.lat,
    required this.farm_reg_no,
    required this.gallery,
    required this.updated_at,
    required this.created_at,
    required this.starting_date,
    required this.current_crop,
    required this.soil_type,
    required this.farm_area,
    required this.mouaza,
    required this.union,
    required this.address,
    required this.farm_name,
    required this.farmer_id,
    required this.farm_id,
  });

  /// factory.
  factory FarmEntity.fromJson(Map<String, dynamic> json) =>
      _$FarmEntityFromJson(json);
  final String farm_id,
      farmer_id,
      farm_name,
      address,
      union,
      mouaza,
      farm_area,
      soil_type,
      current_crop,
      starting_date,
      created_at,
      updated_at;
  final List<dynamic> gallery;
  final String? farm_reg_no;
  final double? lat, long;
  // final String isActive;
}
